---

# nixos-0.0.0.1

Это базовая версия конфигурации NixOS, от которой будет вестись дальнейшее развитие и сопровождение.

---

## ✨ Цель

Перейти от использования Home Manager в standalone-режиме к системному модулю NixOS (`nixosModules.home-manager`) для устранения ошибки:

```
error: attribute 'hm' missing
```

Эта ошибка возникает из-за того, что `lib.hm` недоступен в standalone-режиме, а многие модули (например, `mako`) его требуют.

---

## 📦 Внесённые изменения

* `flake.nix`:

  * Удалена секция `homeConfigurations.yakatze`
  * Добавлена секция `nixosConfigurations.nixos` с подключением `home-manager` как системного модуля (`inputs.home-manager.nixosModules.home-manager`)
* `configuration.nix`:

  * Добавлена конфигурация `home-manager` через NixOS-модуль
  * Импортирован `home.nix` для пользователя `yakatze`

---

## 📝 Пример изменений в `flake.nix`

```nix
modules = [
  { nixpkgs.config.allowUnfree = true; }
  ./nix/configuration.nix
  inputs.home-manager.nixosModules.home-manager
];
```

---

## ✅ Планы

* [ ] Переставить Home Manager на системный модуль
* [ ] Устранить ошибку `lib.hm` / `attribute 'hm' missing`
* [ ] Настроить HM (`home.nix`)

---

## 🏁 Стартовая точка

`nixos-0.0.0.1` — фундаментальная версия, от которой начинается развитие моей флейковой конфигурации NixOS.

---
