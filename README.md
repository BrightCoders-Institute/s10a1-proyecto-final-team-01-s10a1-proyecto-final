![BrightCoders Logo](img/logo.png)

# 🏨 Proyecto Final: Aplicación de Hospedaje (💤lepy)

## 🧩 Indicaciones del Proyecto

> [Ver instrucciones antes de iniciar](./instructions/instructions.md)

## 📋 Tabla de contenido

- [Descripción General](#-descripción-general).
- [Tipos de Usuarios](#-tipos-de-usuarios).
- [Casos de Uso](#🛠-casos-de-uso).
- [Requerimientos funcionales](#-requerimientos-funcionales).
- [Requerimientos no funcionales](#-requerimientos-no-funcionales).
- [Must have (prioridades)](#-must-have-prioridades).
- [Nice to Have](#🎖-nice-to-have).
- [Producto Mínimo Viable (MVP)](#-producto-mínimo-viable-mvp).
- [Autores](#-autores).
- [Badges](#-badges).
- [Licencia](#-licencia).

## 📓 Descripción General
El proyecto "💤lepy" es una aplicación de hospedaje que busca facilitar la interacción entre huéspedes y anfitriones a través de una plataforma intuitiva y segura.

## 🙍 Tipos de Usuarios

- Súper Administrador.
- Usuarios Staff.
- Usuarios Anfitriones.
- Usuarios Finales (Huéspedes).
- Invitados (Tentativo).

## 🛠️ Casos de Uso

### Casos de uso del Usuario Final

- **Buscar Alojamiento:** El usuario busca alojamientos según criterios como ubicación, fechas de estadía, tipo de alojamiento y comodidades.

- **Ver Detalles del Alojamiento:** El usuario visualiza detalles de alojamientos disponibles, incluyendo imágenes, descripciones, comodidades y políticas de cancelación.

- **Reservar Alojamiento:** El usuario selecciona un alojamiento y realiza una reserva para las fechas deseadas.

- **Gestionar Reservas:** El usuario puede ver y gestionar sus reservas, incluyendo confirmaciones, modificaciones y cancelaciones.

- **Explorar Perfil:** El usuario puede ver su perfil, incluyendo información personal e historial de reservas.

- **Dejar Reseñas:** Después de su estadía, el usuario puede dejar una reseña y calificación sobre el alojamiento.

### Casos de uso del Usuario Anfitrión

- **Agregar Alojamiento:** El anfitrión puede agregar detalles de su alojamiento, incluyendo descripciones, tarifas, imágenes y disponibilidad.

- **Gestionar Reservas:** El anfitrión puede ver y gestionar las reservas recibidas, incluyendo confirmaciones, modificaciones y cancelaciones.

- **Interactuar con Huéspedes:** El anfitrión puede comunicarse con los huéspedes para coordinar detalles de la estancia y responder preguntas.

- **Actualizar Perfil:** El anfitrión puede editar su perfil y la información de su alojamiento.

- **Ver Estadísticas:** El anfitrión puede ver estadísticas y análisis sobre el rendimiento de su alojamiento, como ocupación y ganancias.

### Caso de uso del Súper Administrador

- **Gestionar Usuarios:** El superadministrador puede crear, editar, desactivar o eliminar cuentas de usuario.

- **Moderar Contenido:** El superadministrador puede moderar contenido generado por usuarios, como reseñas y publicaciones.

- **Supervisar Transacciones:** El superadministrador puede supervisar transacciones financieras realizadas a través de la plataforma.

- **Ofrecer Soporte:** El superadministrador puede proporcionar soporte técnico y asistencia a usuarios y anfitriones.

### Casos de uso del Staff

- **Gestión de Contenidos:** El usuario staff puede crear, editar y eliminar contenido en la plataforma, como publicaciones en el blog, promociones especiales y eventos.

- **Soporte a Usuarios:** El usuario staff proporciona asistencia y soporte a usuarios y anfitriones en caso de preguntas, problemas técnicos o consultas.

- **Moderación de Contenido:** El usuario staff es responsable de moderar y gestionar el contenido generado por los usuarios, como reseñas, comentarios y publicaciones en la comunidad.

- **Resolución de Problemas:** El usuario staff actúa como punto de contacto para resolver problemas y conflictos entre usuarios y anfitriones.

## ⚙️ Requerimientos Funcionales
### Usuario Invitado

- Consultar el listado de hospedajes disponibles (sin posibilidad a reservar).

### Usuario Final (Huésped)

- **Registro y Autenticación:** Los usuarios finales pueden registrarse en la plataforma utilizando su correo electrónico o cuentas de redes sociales, y luego iniciar sesión de manera segura para acceder a todas las funcionalidades.

- **Búsqueda y Reserva de Alojamientos:** Los usuarios tienen la capacidad de buscar alojamientos según diferentes criterios como ubicación, fechas de estadía, precio y tipo de alojamiento. Pueden visualizar detalles de cada alojamiento, incluyendo imágenes, descripciones, comodidades y políticas de cancelación, y realizar reservas de manera fácil y rápida.

- **Perfiles de Usuario:** Cada usuario final tiene su propio perfil personal donde pueden gestionar su información, ver historial de reservas, guardar alojamientos favoritos y dejar reseñas y calificaciones sobre sus experiencias de hospedaje.

- **Pagos Seguros:** La plataforma ofrece un sistema de pago seguro que permite a los usuarios final realizar transacciones con confianza. Se pueden utilizar diferentes métodos de pago, como tarjetas de crédito, transferencias bancarias o servicios de pago en línea.

- **Comunicación con Anfitriones:** Los usuarios pueden comunicarse directamente con los anfitriones a través de mensajes internos para hacer preguntas, solicitar información adicional o coordinar detalles específicos de su estadía.

- **Soporte al Cliente:** Se ofrece un servicio de atención al cliente dedicado para ayudar a los usuarios con cualquier pregunta, problema o solicitud de asistencia que puedan tener antes, durante o después de su estadía.

- **Calificaciones y Reseñas:** Después de la estancia, los usuarios pueden dejar reseñas sobre el alojamiento y su experiencia con el anfitrión, así como recibir reseñas como huéspedes, lo cual fomenta una comunidad de confianza y transparencia.

### Usuario Anfitrión

- **Registro y Creación de Perfil:** Los anfitriones pueden registrarse en la plataforma proporcionando detalles sobre sus propiedades, como nombre, ubicación, tipo de alojamiento (hotel, casa vacacional, etc.), comodidades ofrecidas y políticas de hospedaje. Pueden crear y gestionar su perfil para destacar las características únicas de sus alojamientos.

- **Gestión de Propiedades:** Los anfitriones tienen la capacidad de listar múltiples propiedades en la plataforma, con la opción de editar la información en cualquier momento. Pueden agregar detalles como descripciones detalladas, tarifas, disponibilidad de habitaciones, fotos de alta calidad y reglas de la casa.

- **Calendario de Disponibilidad:** Los anfitriones pueden administrar el calendario de disponibilidad de cada propiedad, bloqueando fechas no disponibles, gestionando reservas confirmadas y ajustando los precios según la temporada o eventos especiales.

- **Recepción de Reservas:** Los anfitriones reciben notificaciones instantáneas cuando los usuarios finales realizan una reserva en sus propiedades. Pueden revisar y confirmar las reservas pendientes, así como comunicarse con los huéspedes para coordinar detalles adicionales si es necesario.

- **Interacción con Huéspedes:** Los anfitriones pueden mantener una comunicación directa y fluida con los huéspedes a través de la plataforma. Pueden responder preguntas, proporcionar recomendaciones locales, ofrecer servicios adicionales y brindar asistencia durante la estancia para garantizar una experiencia satisfactoria.

- **Gestión de Pagos:** La plataforma facilita el proceso de pago para los anfitriones, permitiéndoles recibir pagos de manera segura y sin complicaciones. Pueden acceder a un registro detallado de transacciones financieras y retirar fondos según sea necesario.

- **Evaluaciones y Retroalimentación:** Después de cada estadía, tanto los anfitriones como los huéspedes pueden dejar reseñas y calificaciones para compartir sus experiencias. Los anfitriones pueden utilizar esta retroalimentación para mejorar sus servicios y aumentar su reputación en la plataforma.

- **Soporte y Recursos:** Se proporciona soporte técnico y recursos adicionales a los anfitriones para ayudarlos a maximizar su éxito en la plataforma. Esto puede incluir tutoriales, guías de mejores prácticas y asistencia personalizada según sea necesario.

### Usuario Staff

- **Gestión de Contenidos:** El usuario staff tendrá la capacidad de crear, editar y eliminar contenido en la plataforma, como publicaciones en el blog, promociones especiales, eventos y noticias relevantes.

- **Soporte a Usuarios:** El usuario staff estará disponible para proporcionar asistencia y soporte a los usuarios finales y anfitriones en caso de preguntas, problemas técnicos o consultas sobre el uso de la plataforma.

- **Moderación de Contenido:** El usuario staff será responsable de moderar y gestionar el contenido generado por los usuarios, incluyendo reseñas, comentarios y publicaciones en la comunidad, para garantizar que cumpla con las normas de la plataforma.

- **Resolución de Problemas:** El usuario staff actuará como punto de contacto para resolver problemas y conflictos entre usuarios finales y anfitriones, asegurando una experiencia positiva para todos los usuarios de la plataforma.

### Usuario Súper Administrador

- Dar o quitar permisos con checkboxes

- **Gestión de Usuarios:** El super administrador tiene el control total sobre los usuarios registrados en la plataforma. Puede crear, editar, desactivar o eliminar cuentas de usuario según sea necesario, así como asignar roles y privilegios específicos a cada usuario.

- **Administración de Contenidos:** El super administrador es responsable de supervisar y gestionar todo el contenido presente en la plataforma. Puede moderar publicaciones, editar información incorrecta o inapropiada, y eliminar contenido que viole los términos de uso de la plataforma.

- **Gestión de Pagos y Transacciones:** El super administrador supervisa todas las transacciones financieras realizadas a través de la plataforma. Puede gestionar métodos de pago, establecer comisiones y tarifas, realizar seguimiento de ingresos y gastos, y generar informes financieros para análisis y auditoría.

- **Soporte y Asistencia:** El super administrador proporciona soporte técnico y asistencia a los usuarios y administradores de la plataforma. Puede responder preguntas, resolver problemas técnicos, brindar orientación sobre el uso de la plataforma y ofrecer capacitación cuando sea necesario.

## 🔭 Requerimientos no funcionales

- **Seguridad de la aplicación:** La seguridad de los datos y la protección contra amenazas como ataques de hackers, inyección de código malicioso y robo de información sensible son fundamentales. Se deben implementar medidas de seguridad como autenticación robusta, autorización adecuada y cifrado de datos.

- **Disponibilidad:** La aplicación debe estar disponible y accesible para los usuarios en todo momento, o al menos durante los periodos de tiempo acordados. Esto implica la implementación de redundancia, tolerancia a fallos y estrategias de recuperación ante desastres (tentativo).

- **Adaptabilidad:** La aplicación debe ser capaz de adaptarse a diferentes dispositivos y navegadores, ya que los usuarios pueden acceder a ella desde una variedad de plataformas y dispositivos.

- **Rendimiento:**: La aplicación debe ser capaz de responder de manera rápida y eficiente a las solicitudes de los usuarios. Esto implica tiempos de carga rápidos, latencia baja y alta capacidad de respuesta, incluso bajo cargas pesadas.

- **Usabilidad**: La interfaz de usuario debe ser intuitiva y fácil de usar para todos los usuarios, independientemente de su nivel de experiencia. Esto implica un diseño centrado en el usuario, navegación clara y consistente, y retroalimentación adecuada para las acciones del usuario.

- **Calidad**: El código de la aplicación debe ser sometido y aprobar pruebas de calidad (sintaxis, semántica y funcionalidades), utilizado herramientas como RuboCop, Reek, RubyCritic y RSpec.

- **Mantenibilidad**: La aplicación debe ser fácil de mantener y actualizar sin causar interrupciones significativas en el servicio. Esto implica un código limpio y bien documentado, así como prácticas de desarrollo ágiles que faciliten la incorporación de nuevas características y corrección de errores.

- **Control de versiones y trabajo ágil**: Todo el código de la aplicación debe alojarse en un repositorio de Git. Los commits deben ser atómicos y los mensajes debe seguir las buenas prácticas. La rama principal debe mantenerse estable en todo momento. Se trabaja según las especificaciones de los archivos [Agile](./instructions/agile.md) y [Workflow](./instructions/workflow.md)

- **Características de Ruby on Rails**: Utilizar como mínimo las herramientas que vienen descritas en el archivo de [Instrucciones](./instructions/instructions.md).

## 🔑 Must have (Prioridades)

- **Seguridad de la aplicación:** Es fundamental asegurar la protección de los datos de los usuarios y la integridad de la plataforma.

- **Registro y Autenticación:** Permitir a los usuarios crear cuentas y acceder de forma segura es esencial para cualquier servicio en línea.

- **Gestión de Usuarios (Usuario Súper Administrador):** La capacidad de administrar cuentas es crucial para mantener el orden y la seguridad en la plataforma.

- **Búsqueda y Reserva de Alojamientos:** Esta es la funcionalidad central de la plataforma, permitiendo a los usuarios encontrar y
  reservar hospedajes.

- **Pagos Seguros:** Para completar las transacciones de reserva, es necesario un sistema de pagos confiable y seguro.

- **Gestión de Propiedades (Usuario Anfitrión):** Permitir a los anfitriones listar y gestionar sus propiedades es fundamental para alimentar la plataforma con ofertas de alojamiento.

- **Calificaciones y Reseñas:** Fomenta la confianza y transparencia entre usuarios y anfitriones.

- **Soporte al Cliente:** Esencial para resolver dudas y problemas, mejorando la experiencia del usuario.

- **Adaptabilidad y Rendimiento:** Garantizar que la plataforma sea accesible y eficiente en diferentes dispositivos y condiciones de red.

- **Usabilidad:** Asegurar una interfaz intuitiva y fácil de usar mejora la satisfacción del usuario.

- **Calidad y Mantenibilidad del Código:** Importante para la escalabilidad y la facilidad de mantenimiento a largo plazo.

- **Control de versiones y trabajo ágil:** Facilita la colaboración y mantiene la estabilidad del proyecto.

- **Características de Ruby on Rails:** Aprovechar las herramientas específicas del framework puede mejorar la eficiencia del desarrollo.

- **Comunicación con Anfitriones y Gestión de Contenidos (Usuario Staff):** Aunque importantes, estas funcionalidades apoyan y enriquecen la experiencia del usuario y del anfitrión, pero no son críticas para el lanzamiento inicial de la plataforma.

- **Consulta de listado de hospedajes (Usuario Invitado):** Proporciona valor a los usuarios no registrados, pero su prioridad es menor comparada con las funcionalidades esenciales para usuarios registrados.

## 🎖️ Nice to Have

- Actualización a tiempo real de la UI según los cambios efectuados en la base de datos.

- Actualización a tiempo real de precios.

- (Super Administrador) Configuración del Sitio: El super administrador tiene acceso a herramientas de configuración avanzadas para personalizar la apariencia y el funcionamiento de la plataforma. Puede ajustar la estructura de navegación, configurar opciones de pago, establecer políticas de privacidad y términos de servicio, entre otras configuraciones.

- Modo oscuro.

## 🎲 Producto Mínimo Viable (MVP)

### Características del MVP para Usuarios Finales:

- **Registro de Usuario:** Los usuarios finales podrán registrarse en la plataforma utilizando su correo electrónico o cuentas de redes sociales.

- **Búsqueda de Alojamiento:** Los usuarios podrán buscar alojamientos según la ubicación deseada, fechas de estadía y otros criterios relevantes.

- **Visualización de Alojamientos:** Se mostrará una lista de alojamientos disponibles que cumplan con los criterios de búsqueda del usuario, junto con detalles básicos como imágenes, descripciones y tarifas.

- **Reserva de Alojamiento:** Los usuarios podrán seleccionar un alojamiento de la lista y realizar una reserva para las fechas deseadas.

- **Gestión de Perfil:** Los usuarios podrán editar su perfil, incluyendo información básica y preferencias de viaje.

### Características del MVP para Anfitriones:

- **Registro de Anfitrión:** Los anfitriones podrán registrarse en la plataforma proporcionando detalles básicos sobre sus propiedades.

- **Listado de Propiedades:** Los anfitriones podrán agregar y gestionar listados de propiedades, incluyendo información como descripciones, tarifas y disponibilidad.

- **Gestión de Reservas:** Los anfitriones podrán revisar y confirmar las reservas realizadas por los usuarios finales, así como comunicarse con los huéspedes para coordinar detalles adicionales si es necesario.

- **Gestión de Perfil:** Los anfitriones podrán editar su perfil personal y de propiedad, así como agregar y actualizar información relevante.

### Características del MVP para Super Administrador

- **Gestión de Usuarios:** El super administrador tiene el control total sobre los usuarios registrados en la plataforma. Puede crear, editar, desactivar o eliminar cuentas de usuario según sea necesario, así como asignar roles y privilegios específicos a cada usuario.

## 🕹️ Autores

- **[ramondiaz21](https://github.com/ramondiaz21)**
- **[AnaCarrizales](https://github.com/AnaCarrizales)**
- **[ErikGmz](https://github.com/ErikGmz)**
- **[farellano0](https://github.com/farellano0)**
- **[STR1ND3R](https://github.com/STR1ND3R)**
- **[alandin1](https://github.com/alandin1)**
- **[DevLuis123](https://github.com/DevLuis123)**

## 💻 Badges

![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white)
![Rails](https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
![Redis](https://img.shields.io/badge/redis-%23DD0031.svg?style=for-the-badge&logo=redis&logoColor=white)
![Postgres](https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white)
![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white)
![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)

## 📖 Licencia

Esta obra está bajo una
[Licencia Creative Commons Atribución-NoComercial-CompartirIgual 4.0 Internacional][cc-by-nc-sa].

[![CC BY-NC-SA 4.0][cc-by-nc-sa-image]][cc-by-nc-sa]

[cc-by-nc-sa]: https://creativecommons.org/licenses/by-nc-sa/4.0/deed.es
[cc-by-nc-sa-image]: https://licensebuttons.net/l/by-nc-sa/4.0/88x31.png
[cc-by-nc-sa-shield]: https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg
