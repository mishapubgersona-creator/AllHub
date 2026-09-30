const express = require('express');
const fs = require('fs');
const path = require('path');

const app = express();
const PORT = 3000;
const USERS_FILE = path.join(__dirname, 'users-ip.json');

// Инициализация файла
if (!fs.existsSync(USERS_FILE)) {
  fs.writeFileSync(USERS_FILE, JSON.stringify([], null, 2));
}

// Получаем реальный IP (учитываем прокси)
function getClientIP(req) {
  const forwarded = req.headers['x-forwarded-for'];
  if (forwarded) return forwarded.split(',')[0].trim();
  return req.socket.remoteAddress || req.connection.remoteAddress;
}

// Определение страны через бесплатный API
async function getCountry(ip) {
  try {
    const cleanIP = ip.replace('::ffff:', '').replace('::1', '127.0.0.1');
    const res = await fetch(`http://ip-api.com/json/${cleanIP}?fields=status,country,countryCode,city`);
    const data = await res.json();
    if (data.status === 'success') {
      return { country: data.country, city: data.city, code: data.countryCode };
    }
  } catch (e) {
    console.error('Geo lookup failed:', e.message);
  }
  return { country: 'Unknown', city: 'Unknown', code: 'XX' };
}

app.use(express.static('public'));

// Логирование IP при заходе
app.post('/api/visit', async (req, res) => {
  const ip = getClientIP(req);
  const geo = await getCountry(ip);

  const entry = {
    ip,
    country: geo.country,
    city: geo.city,
    code: geo.code,
    time: new Date().toISOString()
  };

  try {
    const existing = JSON.parse(fs.readFileSync(USERS_FILE, 'utf-8'));
    existing.push(entry);
    fs.writeFileSync(USERS_FILE, JSON.stringify(existing, null, 2));
  } catch (e) {
    console.error('Write error:', e.message);
  }

  res.json({ ok: true });
});

app.listen(PORT, '0.0.0.0', () => {
  console.log(`🚀 MashUnion запущен на:`);
  console.log(`   → http://localhost:${PORT}  (для этого ПК)`);
  console.log(`   → http://<ваш-локальный-IP>:${PORT}  (для телефона)`);
});