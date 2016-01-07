## Observables

- Angular embraces observables using the RxJS library.
- Observables emit events and observers observe observables.
- An observer *subscribes* to events emitted from an observable.
- RxJS has an object called *subject* that can be used both as an observer or an observable. *Subject* can be imported from `RxJS` very easily:

    ~~~~{.numberLines .java startFrom="1"}
    import {Subject} from 'rxjs/Subject';
    ~~~~~~~
- A subscription can be canceled by calling the `unsubscribe` method.
