![BrightCoders Logo](img/logo.png)

# 🏨 Proyecto Final: Aplicación de Hospedaje (💤lepy)

## 🧩 Indicaciones del Proyecto

> [Ver instrucciones antes de iniciar](./instructions/instructions.md)

## 📋 Tabla de contenido

- Descripción General.
- Tipos de Usuarios.
- Casos de Uso.
- Funcionalidades.
- Nice to Have.
- Producto Mínimo Viable (MVP).
- Autores.
- Badges.
- Licencia.

## 📓 Descripción General

Sistema web orientado a la administración, reservación, alojamiento y puntuación de una gran variedad de sitios de hospedaje, teniendo como principal objetivo garantizar, por medio de experiencias relajantes y tranquilizantes, la comodidad de todos los huéspedes. La aplicación está sumamente basada en Airbnb.

## 🙍 Tipos de Usuarios.

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

- **Explorar Perfil:** El usuario puede ver su perfil, incluyendo información personal y historial de reservas.

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

## ⚙️ Funcionalidades

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
