## Sistema pedidos

## Tipo de proyecto: Sistema de pedidos

### Resumen del proyecto

Para facilitar el análisis y el desarrollo del proyecto, los 10 archivos proporcionados se pueden organizar en tres categorías lógicas que representan el ciclo desde el entendimiento de la necesidad del cliente hasta la definición técnica del sistema:

#### Clasificación y orden de los archivos

- **Categoría A:** Relevamiento de necesidades y contacto con el cliente.
- **Categoría B:** Evidencias de la operación real (análisis de campo).
- **Categoría C:** Diseño de solución y planificación técnica (equipo de desarrollo).

#### Resumen de lo que pide el cliente: Sabor Kiosco

A partir de las fuentes analizadas, la necesidad de **Sabor Kiosco** se resume en los siguientes puntos principales:

- **Problema de negocio actual:** motivo por el que el cliente necesita el sistema.
- **Requerimientos funcionales para el MVP:** funcionalidades que debe incluir el sistema.
- **Exclusiones clave del MVP:** funcionalidades que quedan fuera del alcance de esta fase para garantizar una entrega rápida a fines de julio de 2025.

### Descripción del paradigma orientado a objetos

El paradigma orientado a objetos organiza el sistema mediante objetos que representan entidades del dominio y combinan sus datos con las operaciones que pueden realizar. En este proyecto, conceptos como clientes, pedidos, productos y pagos pueden modelarse como clases con atributos y métodos propios.

Este enfoque permite mantener cada responsabilidad encapsulada, reutilizar comportamientos mediante la herencia cuando sea necesario y aplicar polimorfismo para que distintos objetos respondan de forma particular a una misma operación. De esta manera, el sistema de pedidos puede ser más modular, fácil de mantener y flexible para incorporar nuevas funcionalidades.

### Los cuatro fundamentos de POO

#### Abstracción

Consiste en representar únicamente las características y comportamientos relevantes de una entidad, ocultando los detalles innecesarios. Por ejemplo, la clase `Pedido` puede mostrar su número, estado y total, sin exponer cómo se calcula internamente cada valor.

#### Encapsulamiento

Permite proteger los datos internos de un objeto y controlar su acceso mediante métodos. En el sistema, el estado de un pedido no debería modificarse directamente, sino a través de operaciones como `confirmar()`, `cancelar()` o `actualizarEstado()`.

#### Herencia

Permite crear nuevas clases a partir de otras existentes, reutilizando sus atributos y comportamientos. Por ejemplo, distintos tipos de usuario podrían compartir características de una clase `Usuario` y agregar funcionalidades específicas.

#### Polimorfismo

Permite que objetos de diferentes clases respondan de manera particular a una misma operación. Por ejemplo, distintos medios de pago podrían implementar el método `procesarPago()` según sus propias reglas.

### Integrantes del proyecto

| Integrante | Usuario de GitHub | Rol |
|---|---|---|
| Lautaro Chumacero | [@chumacerolautaro6-droid](https://github.com/chumacerolautaro6-droid) | Analista de requerimientos |
| Santiago Medel | [@santimarM](https://github.com/santimarM) | Modelador de casos de uso |
| Sebastian Benitez | [@Sebas-Benitez](https://github.com/Sebas-Benitez) | Diseñador de clases iniciales |
| Fernando Molina | [@fernandodanielm](https://github.com/fernandodanielm) | Coordinador/Documentador |