import tkinter as tk
from tkinter import ttk
import pyautogui
import threading
import time

class AutoClicker:
    def __init__(self):
        self.root = tk.Tk()
        self.root.title("Автокликер")
        self.root.geometry("1280x900")
        self.root.resizable(False, False)
        
        # Цветовая схема
        self.bg_color = "#2b2b2b"
        self.fg_color = "#ffffff"
        self.accent_color = "#4CAF50"
        self.stop_color = "#f44336"
        
        self.root.configure(bg=self.bg_color)
        
        self.clicking = False
        self.click_thread = None
        self.delay = 0.000001 # 0.4 миллисекунды
        
        self.setup_ui()
        
    def setup_ui(self):
        # Заголовок
        title_label = tk.Label(
            self.root,
            text="АВТОКЛИКЕР",
            font=("Arial", 36, "bold"),
            bg=self.bg_color,
            fg=self.accent_color
        )
        title_label.pack(pady=30)
        
        # Информация о задержке
        delay_frame = tk.Frame(self.root, bg=self.bg_color)
        delay_frame.pack(pady=20)
        
        delay_label = tk.Label(
            delay_frame,
            text=f"Задержка между кликами: {self.delay * 1000:.1f} мс",
            font=("Arial", 18),
            bg=self.bg_color,
            fg=self.fg_color
        )
        delay_label.pack()
        
        clicks_per_second = 1 / self.delay
        speed_label = tk.Label(
            delay_frame,
            text=f"Скорость: {clicks_per_second:,.0f} кликов/сек",
            font=("Arial", 16),
            bg=self.bg_color,
            fg="#888888"
        )
        speed_label.pack(pady=10)
        
        # Статус
        self.status_label = tk.Label(
            self.root,
            text="СТАТУС: ОСТАНОВЛЕНО",
            font=("Arial", 24, "bold"),
            bg=self.bg_color,
            fg=self.stop_color
        )
        self.status_label.pack(pady=30)
        
        # Счетчик кликов
        self.click_count = 0
        self.counter_label = tk.Label(
            self.root,
            text="Кликов: 0",
            font=("Arial", 20),
            bg=self.bg_color,
            fg=self.fg_color
        )
        self.counter_label.pack(pady=20)
        
        # Кнопки управления
        button_frame = tk.Frame(self.root, bg=self.bg_color)
        button_frame.pack(pady=40)
        
        # Кнопка Старт
        self.start_button = tk.Button(
            button_frame,
            text="▶ СТАРТ (F6)",
            command=self.start_clicking,
            font=("Arial", 18, "bold"),
            bg=self.accent_color,
            fg="white",
            width=20,
            height=3,
            cursor="hand2"
        )
        self.start_button.pack(side=tk.LEFT, padx=20)
        
        # Кнопка Стоп
        self.stop_button = tk.Button(
            button_frame,
            text="■ СТОП (F7)",
            command=self.stop_clicking,
            font=("Arial", 18, "bold"),
            bg=self.stop_color,
            fg="white",
            width=20,
            height=3,
            state=tk.DISABLED,
            cursor="hand2"
        )
        self.stop_button.pack(side=tk.LEFT, padx=20)
        
        # Инструкция
        instruction_frame = tk.Frame(self.root, bg="#1e1e1e", relief=tk.RIDGE, bd=2)
        instruction_frame.pack(pady=40, padx=50, fill=tk.BOTH, expand=True)
        
        instruction_title = tk.Label(
            instruction_frame,
            text="УПРАВЛЕНИЕ",
            font=("Arial", 18, "bold"),
            bg="#1e1e1e",
            fg=self.accent_color
        )
        instruction_title.pack(pady=15)
        
        instructions = [
            "• F6 - Запустить автокликер",
            "• F7 - Остановить автокликер",
            "• Esc - Выход из программы",
            "",
            "⚠ ВНИМАНИЕ:",
            "• Кликер сработает на текущей позиции курсора",
            "• Скорость: 2500 кликов в секунду",
            "• Для безопасности используйте F7 для остановки"
        ]
        
        for instruction in instructions:
            tk.Label(
                instruction_frame,
                text=instruction,
                font=("Arial", 14),
                bg="#1e1e1e",
                fg="#cccccc" if not instruction.startswith("⚠") else "#ff9800",
                justify=tk.LEFT
            ).pack(anchor=tk.W, padx=30, pady=3)
        
        # Привязка горячих клавиш
        self.root.bind('<F6>', lambda e: self.start_clicking())
        self.root.bind('<F7>', lambda e: self.stop_clicking())
        self.root.bind('<Escape>', lambda e: self.quit_app())
        
        # Обработка закрытия окна
        self.root.protocol("WM_DELETE_WINDOW", self.quit_app)
        
    def click_loop(self):
        while self.clicking:
            pyautogui.click()
            self.click_count += 1
            self.update_counter()
            time.sleep(self.delay)
    
    def update_counter(self):
        if self.click_count % 100 == 0:  # Обновляем интерфейс каждые 100 кликов
            self.root.after(0, lambda: self.counter_label.config(
                text=f"Кликов: {self.click_count:,}"
            ))
    
    def start_clicking(self):
        if not self.clicking:
            self.clicking = True
            self.click_count = 0
            
            self.status_label.config(text="СТАТУС: РАБОТАЕТ", fg=self.accent_color)
            self.start_button.config(state=tk.DISABLED)
            self.stop_button.config(state=tk.NORMAL)
            
            self.click_thread = threading.Thread(target=self.click_loop, daemon=True)
            self.click_thread.start()
    
    def stop_clicking(self):
        if self.clicking:
            self.clicking = False
            
            self.status_label.config(text="СТАТУС: ОСТАНОВЛЕНО", fg=self.stop_color)
            self.start_button.config(state=tk.NORMAL)
            self.stop_button.config(state=tk.DISABLED)
            
            # Финальное обновление счетчика
            self.counter_label.config(text=f"Кликов: {self.click_count:,}")
    
    def quit_app(self):
        self.clicking = False
        self.root.destroy()
    
    def run(self):
        self.root.mainloop()

if __name__ == "__main__":
    app = AutoClicker()
    app.run()