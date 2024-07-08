# app-component Terraform structure

A battle tested way of structuring Terraform modules in a reusable way.

## How does it work?

There are only three layers in the structure:

1. _environment(s)_ - your root module(s)
2. _apps_ - specific deployment use-cases
3. _components_ - generic modules containing common resource combinations

Thanks to that, we limit the number of layers - decreasing the complexity of both possible dependency trees and Terraform state paths.

It can be used with both the branch-per-environment approach, as well as with the environments folder approach, as illustrated in this repo.

It's perfectly fine for apps to not contain any components and for the environments to use components directly. Referencing components from other components should be used with caution.

## Data placement

Although not strictly a part of the structure, it is important to mind where you place your configuration data. I've found it very cumbersome to try making everything as universal as possible, so I recommend placing configuration data where it makes sense - if it's per environment, place it in the environment. If it's per-app, place it in the app and if it's a global setting in the project, place it in a component.
