# app-component Terraform structure

A battle tested way of structuring Terraform modules in a reusable way.

## How does it work?

There are only three layers in the structure:

1. **environment(s)** - your root module(s)
2. **apps** - specific deployment use-cases
3. **components** - generic modules containing common resource combinations

```
environments/
  prod/
    main.tf              # provider config, backend, etc.
    blue_website.tf      # calls apps/blue_website
    green_website.tf     # calls apps/green_website
apps/
  blue_website/
    main.tf              # calls components/static_website + app-specific resources
    outputs.tf
  green_website/
    main.tf
    outputs.tf
components/
  static_website/
    main.tf              # generic, reusable resource group
    variables.tf
    outputs.tf
```

The dependency flow is:

```
environment ──► app ──► component
      │                     ▲
      └─────────────────────┘
```

Environments can call apps, and apps can call components. It's also perfectly fine for environments to use components directly (skipping the app layer) and for apps to not contain any components.

Thanks to that, we limit the number of layers - decreasing the complexity of both possible dependency trees and Terraform state paths.

It can be used with both the branch-per-environment approach, as well as with the environments folder approach, as illustrated in this repo.

Referencing components from other components should be used with caution — it introduces tight coupling between generic modules and can lead to circular dependencies or deeply nested state paths that are hard to reason about and refactor.

## Data placement

Although not strictly a part of the structure, it is important to mind where you place your configuration data. I've found it very cumbersome to try making everything as universal as possible, so I recommend placing configuration data where it makes sense - if it's per environment, place it in the environment. If it's per-app, place it in the app and if it's a global setting in the project, place it in a component.
