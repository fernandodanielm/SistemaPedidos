# Introducción

## Descripción del paradigma orientado a objetos

El paradigma orientado a objetos organiza el sistema mediante objetos que representan entidades del dominio y combinan sus datos con las operaciones que pueden realizar. En este proyecto, conceptos como clientes, pedidos, productos y pagos pueden modelarse como clases con atributos y métodos propios.

Este enfoque permite mantener cada responsabilidad encapsulada, reutilizar comportamientos mediante la herencia cuando sea necesario y aplicar polimorfismo para que distintos objetos respondan de forma particular a una misma operación. De esta manera, el sistema de pedidos puede ser más modular, fácil de mantener y flexible para incorporar nuevas funcionalidades.

## Los cuatro fundamentos de POO

### Abstracción

Consiste en representar únicamente las características y comportamientos relevantes de una entidad, ocultando los detalles innecesarios. Por ejemplo, la clase `Pedido` puede mostrar su número, estado y total, sin exponer cómo se calcula internamente cada valor.

### Encapsulamiento

Permite proteger los datos internos de un objeto y controlar su acceso mediante métodos. En el sistema, el estado de un pedido no debería modificarse directamente, sino a través de operaciones como `confirmar()`, `cancelar()` o `actualizarEstado()`.

### Herencia

Permite crear nuevas clases a partir de otras existentes, reutilizando sus atributos y comportamientos. Por ejemplo, distintos tipos de usuario podrían compartir características de una clase `Usuario` y agregar funcionalidades específicas.

### Polimorfismo

Permite que objetos de diferentes clases respondan de manera particular a una misma operación. Por ejemplo, distintos medios de pago podrían implementar el método `procesarPago()` según sus propias reglas.

## Requisitos iniciales

### Requisitos funcionales

- **RF1:** Toma de pedidos con personalizaciones y combos.
- **RF2:** Envío automático de comandas a la cocina.
- **RF3:** Seguimiento y visualización del estado del pedido.
- **RF4:** Modificación de pedidos activos antes de la preparación.
- **RF5:** Cancelación completa del pedido.
- **RF6:** Identificación del pedido para el retiro.
- **RF7:** Priorización manual.
- **RF8:** Registro de pago.

### Requisitos no funcionales

- **RNF1:** Incorporación futura de nuevos locales.
- **RNF2:** Simplicidad operativa y facilidad de uso.
- **RNF3:** Restricción de tiempo de entrega.
- **RNF4:** Integridad de datos y consistencia del estado.
- **RNF5:** Seguridad y trazabilidad de operaciones.

## Casos de uso

Los cinco casos de uso principales se documentan con actores, flujo, precondiciones y postcondiciones:

1. **CU1 - Tomar Pedido:** registrar el pedido, calcular su total y enviarlo a cocina.
2. **CU2 - Modificar Pedido:** actualizar un pedido mientras permanece en estado `Recibido`.
3. **CU3 - Cambiar Estado del Pedido:** gestionar las transiciones `Recibido`, `En preparación` y `Listo`.
4. **CU4 - Cancelar Pedido:** cancelar el pedido conservando su historial.
5. **CU5 - Entregar Pedido:** identificar y marcar como `Entregado` un pedido listo.

El desarrollo detallado se conserva en [casos_de_uso.md](../modelador%20de%20caso%20de%20uso/casos_de_uso.md).

## Boceto inicial de clases

El modelo inicial contempla `Local`, `Cliente`, `Pedido`, `ItemPedido`, `Producto`, `Combo`, `Comanda`, `Cocina`, `Pago`, `Operador` y `RegistroAuditoria`, junto con sus relaciones y enumeraciones de estado. La fuente editable está en [01-boceto-inicial.excalidraw](../diagramas/01-diagrama-clases/01-boceto-inicial.excalidraw).
