# Introducción

## 1. Descripción del paradigma orientado a objetos
El paradigma orientado a objetos organiza el sistema mediante objetos que representan entidades del dominio y combinan sus datos con las operaciones que pueden realizar. En este proyecto, conceptos como clientes, pedidos, productos, pagos y usuarios pueden modelarse como clases con atributos y métodos propios.

Este enfoque permite mantener cada responsabilidad encapsulada, reutilizar comportamientos mediante herencia cuando sea necesario y aplicar polimorfismo para que distintos objetos respondan de forma particular a una misma operación. De esta manera, el sistema de pedidos puede ser más modular, fácil de mantener y flexible para incorporar nuevas funcionalidades.

## 2. Los cuatro fundamentos de POO

### Abstracción
Consiste en representar únicamente las características y comportamientos relevantes de una entidad, ocultando los detalles innecesarios. Por ejemplo, la clase Pedido puede mostrar su número, estado y total, sin exponer cómo se calcula cada valor internamente.

### Encapsulamiento
Permite proteger los datos internos de un objeto y controlar su acceso mediante métodos. En el sistema, el estado de un pedido no debería modificarse directamente, sino a través de operaciones como confirmar(), cancelar() o cambiarEstado().

### Herencia
Permite crear nuevas clases a partir de otras existentes, reutilizando sus atributos y comportamientos. Por ejemplo, distintos tipos de usuario podrían compartir características de una clase Usuario y agregar funcionalidades específicas.

### Polimorfismo
Permite que objetos de diferentes clases respondan de manera particular a una misma operación. Por ejemplo, distintos medios de pago podrían implementar el método procesarPago() según sus propias reglas.

## 3. Requisitos iniciales del sistema

### 3.1 Requisitos funcionales
- RF1: toma de pedidos con personalizaciones y combos.
- RF2: envío automático de comandas a la cocina.
- RF3: seguimiento y visualización del estado del pedido.
- RF4: modificación de pedidos activos antes de la preparación.
- RF5: cancelación completa del pedido.
- RF6: identificación del pedido para el retiro.
- RF7: priorización manual.
- RF8: registro de pago.

### 3.2 Requisitos no funcionales
- RNF1: el sistema debe permitir incorporar nuevos locales en el futuro.
- RNF2: simplicidad operativa y facilidad de uso.
- RNF3: restricción de tiempo de entrega.
- RNF4: integridad de datos y consistencia del estado.
- RNF5: seguridad y trazabilidad de operaciones.

## 4. Alcance del MVP
El MVP incluye la gestión básica de pedidos, la comunicación con cocina, la visualización del estado, la actualización de órdenes activas, la cancelación, la identificación para retiro y el registro del pago. Se prioriza una solución simple, funcional y rápida de implementar en el tiempo disponible.

## 5. Casos de uso principales
Los cinco casos de uso principales se documentan con actores, flujo, precondiciones y postcondiciones:

1. CU1 - Tomar Pedido: registrar el pedido, calcular su total y enviarlo a cocina.
2. CU2 - Modificar Pedido: actualizar un pedido mientras permanece en estado Recibido.
3. CU3 - Cambiar Estado del Pedido: gestionar las transiciones Recibido, En preparación y Listo.
4. CU4 - Cancelar Pedido: cancelar el pedido conservando su historial.
5. CU5 - Entregar Pedido: identificar y marcar como Entregado un pedido listo.

El desarrollo detallado se conserva en [casos_de_uso.md](../modelador%20de%20caso%20de%20uso/casos_de_uso.md).

## 6. Regla de negocio central
Un pedido solo puede cambiar de estado siguiendo una secuencia válida:
- Recibido → En preparación → Listo → Entregado
- Recibido → Cancelado
- En preparación → Cancelado
- Listo → Cancelado con autorización del encargado
- Entregado → no modificable ni cancelable

## 7. Modelo de dominio inicial
El modelo inicial contempla Local, Usuario, Cliente, Pedido, ItemPedido, Producto, Combo, Personalizacion, Comanda, Pago, RegistroAuditoria y EstadoPedido, junto con sus relaciones y enumeraciones de estado. La fuente editable está en [01-boceto-inicial.excalidraw](../diagramas/01-diagrama-clases/01-boceto-inicial.excalidraw).

## 8. Arquitectura sugerida
Se recomienda una separación por capas:
- capa de dominio: entidades y reglas del negocio,
- capa de aplicación: lógica de casos de uso,
- capa de infraestructura: persistencia y auditoría,
- capa de presentación: interfaz para mostrador y cocina.

## 9. Conclusión
El proyecto se enmarca en una solución orientada a objetos con alta claridad funcional y poca complejidad operacional. El enfoque del MVP está orientado a cubrir las necesidades críticas del negocio sin perder la posibilidad de ampliar el sistema en futuras etapas.
