# Esperar App

Bienvenido al proyecto Esperar App, un emocionante proyecto desarrollado con Flutter.

## Descripción

Este proyecto es una aplicación increíble construida con Flutter. [Flutter](https://flutter.dev/) es un marco de desarrollo de código abierto creado por Google que te permite construir aplicaciones nativas hermosas para dispositivos móviles, web y escritorio desde una única base de código.

## Versión de Flutter

Este proyecto se desarrolla utilizando Flutter en la versión **<span style="color: cyan;">3.16.7</span>** y Tools Dart **<span style="color: cyan;">3.2.4</span>**. Asegúrate de tener Flutter y [FVM](https://fvm.app/es/) instalado en tu sistema antes de comenzar .

```bash
flutter --version

fvm --version
```

## Creación de Modelos

Los modelos en este proyecto son generados utilizando clases generadoras. Para generar los modelos, ejecuta el siguiente comando en la terminal:

```bash
dart run build_runner build --delete-conflicting-outputs
```
Este comando utiliza build_runner para generar los archivos necesarios basados en las clases definidas en tu proyecto. Asegúrate de ejecutar este comando después de realizar cambios en las clases de modelo para mantener los archivos generados actualizados.

Nota: Asegúrate de que tu terminal esté en la raíz del proyecto antes de ejecutar el comando.
