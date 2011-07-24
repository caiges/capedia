# Capedia

Given a configuration file that understands the steps used to perform common tasks, capedia manages the lifecycle of your application.

## Application creation

    capedia app create [app name] [config]

Creates a barebones system setup for application.

This includes home directory, permissions

## Application deletion

    capedia app delete [app name]

Deletes specified application, prompts for verification.

## Application web configuration creation

    capedia web create [app name]

Creates a bare bones web server configuration for [web server].

## Application web configuration deletion

    capedia web delete [app name]

Deletes the specified web server configuration for [app name].

## Enabling application

    capedia activate [app name]

Starts the application using the application's configuration steps.

## Disabling application

    capedia deactivate [app name]

Stops the application using the application's configuration steps.