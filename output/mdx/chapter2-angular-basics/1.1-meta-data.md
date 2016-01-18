## Metadata Classes

- Angular uses Metadata to decorate classes, methods and properties.
- The most notable Metadata is the `@component` Metadata.
- Metadta classes are very convenient and they make it easy to work with components, services and the dependency injection system

Below is a list of Angular's core Metadata classes categorized under directives/components, pipes and di.

**Directive/component Meta-data**

- [Component](https://angular.io/docs/ts/latest/api/core/ComponentMetadata-class.html): used to define a component

    - [View](https://angular.io/docs/ts/latest/api/core/ViewMetadata-class.html): used to define the template for a component
    - [ViewChild](https://angular.io/docs/ts/latest/api/core/ViewChildMetadata-class.html): used to configure a view query
    - [ViewChildren](https://angular.io/docs/ts/latest/api/core/ViewChildrenMetadata-class.html): used to configure a view query

- [Directive](https://angular.io/docs/ts/latest/api/core/DirectiveMetadata-class.html): used to define a directive

    - [Attribute](https://angular.io/docs/ts/latest/api/core/AttributeMetadata-class.html)  used to grab the value of an attribute on an element hosting a directive
    - [ContentChild](https://angular.io/docs/ts/latest/api/core/ContentChildMetadata-class.html): used to configure a content query
    - [ContentChildren](https://angular.io/docs/ts/latest/api/core/ContentChildrenMetadata-class.html): used to configure a content query
    - [Input](https://angular.io/docs/ts/latest/api/core/InputMetadata-class.html): used to define the input to a directive/component
    - [Output](https://angular.io/docs/ts/latest/api/core/OutputMetadata-class.html): used to define the output events of a directive/component
    - [HostBinding](https://angular.io/docs/ts/latest/api/core/HostBindingMetadata-class.html): used to declare a host property binding
    - [HostListener](https://angular.io/docs/ts/latest/api/core/HostListenerMetadata-class.html): used to declare a host listener

**Pipes**

  - [Pipe](https://angular.io/docs/ts/latest/api/core/PipeMetadata-class.html): used to declare reusable pipe function

**DI**

  - [Inject](https://angular.io/docs/ts/latest/api/core/InjectMetadata-class.html): parameter metadata that specifies a dependency.
  - [Injectable](https://angular.io/docs/ts/latest/api/core/InjectableMetadata-class.html): a marker metadata that marks a class as available to Injector for creation.
  - [Host](https://angular.io/docs/ts/latest/api/core/HostMetadata-class.html): Specifies that an injector should retrieve a dependency from any injector until reaching the closest host.
  - [Optional](https://angular.io/docs/ts/latest/api/core/OptionalMetadata-class.html): parameter metadata that marks a dependency as optional
  - [Self](https://angular.io/docs/ts/latest/api/core/SelfMetadata-class.html): Specifies that an Injector should retrieve a dependency only from itself.
  - [SkipSelf](https://angular.io/docs/ts/latest/api/core/SkipSelfMetadata-class.html): Specifies that the dependency resolution should start from the parent injector.
  - [Query](https://angular.io/docs/ts/latest/api/core/QueryMetadata-class.html): Declares an injectable parameter to be a live list of directives or variable bindings from the content children of a directive.
  - [ViewQuery](https://angular.io/docs/ts/latest/api/core/ViewQueryMetadata-class.html): Similar to `QueryMetadata`, but querying the component view, instead of the content children.

