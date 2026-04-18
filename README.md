# SOND Landing — Premium Redesign Brief for Claude Design

Снимок-контейнер на 2026-04-18 для подключения через **Claude Design → Connect GitHub**.

## Точка входа

Прочитай **`BRIEF.md`** целиком. Там 9 секций — цели, визуальные токены, копирайтинг-мандат, технические ограничения, стартовый промпт.

## Структура

```
.
├── BRIEF.md                              ← главный документ, читать первым
├── current_site/
│   ├── index_ru.html                     ← текущая RU главная (что переделываем)
│   ├── index_en.html                     ← EN версия для контекста переводов
│   └── sond_ru.css                       ← текущий CSS (выкидываем, пишем заново)
├── screenshots/                          ← 9 PNG iOS-приложения для галереи
├── brand/
│   ├── BRAND_PLATFORM.md                 ← Brand DNA, ToV, словарь, табу
│   ├── SOND_marketing_context.md         ← customer research (5 персон, JTBD, триггеры) — ОБЯЗАТЕЛЬНО
│   ├── app-icon.png                      ← иконка приложения
│   └── favicon.svg                       ← favicon
└── reference_ios/
    └── DesignSystem.swift                ← источник цветов/типографики/spacing для визуальной ДНК
```

## Что делаем

Премиум-редизайн **главной страницы** SOND (sond.evdokimov.ai/ru) — визуально консистентной с iOS-приложением. Полностью переписать тексты в голосе SOND, убрать все эмоджи, заменить на тонкие SVG line-icons.

## Стартовый промпт для Claude Design

См. **§9.4 BRIEF.md** — там готовая формулировка.

---

**Контакт:** sond@evdokimov.ai · @ltune (Telegram)
