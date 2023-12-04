_No frills Laravel Jetstream development setup with no fancy magic_

# Jetstreamer

[![MIT](https://img.shields.io/github/license/hishamk/jetstreamer)](https://img.shields.io/github/license/hishamk/jetstreamer)

Ahoy! This is a boilerplate setup for Laravel projects using Jetstream (+teams +Livewire +Volt) and Postgres. It's configured to use Docker and Docker Compose for development. It also includes a Makefile and Taskfile for your convenience.

Once you're done setting up your project, you can start developing your Laravel project with Jetstream right away. When you're ready to deploy your project, you can use the `eject` command to remove the boilerplate from your project.

> ⚠️ Please keep in mind that this was made for my own personal use as I've recently had to grok through the php/Laravel universe for a new project and wanted to have a no-frills way to setup projects without excessive abstraction magic. I've shared it here in case it might be useful to someone else.
>
> ⚠️ There currently is no production-specific configuration. If you want to deploy your project, you'll have to configure it yourself after ejecting.

## Usage

Both Makefile and Taskfile are available for your convenience. You can use either one to run the commands below.

#### Taskfile

If you're using Taskfile, you can replace `make` with `task` in the commands below and vars such as `PROJECT_NAME=value make setup` with `PROJECT_NAME=value task setup` for instance, or set PROJECT_NAME in your shell environment.

#### Setup Project

Use the following command to set up your project:

```bash
make setup PROJECT_NAME=<project_name=no-name-project>
```

Replace `<project_name>` with your desired project name. This command initializes your project.

#### Start Development Containers

To start the development containers, use:

```bash
make start-dev PROJECT_NAME=<project_name=no-name-project>
```

This command will begin running your Laravel project in development mode.

#### Rebuild Development Containers

To rebuild the development containers, run:

```bash
make rebuild-dev PROJECT_NAME=<project_name=no-name-project>
```

This command can be useful when you need to update or reconfigure your development environment.

#### Destroy Project

If you want to completely remove all project files, containers, and images, you can use:

```bash
make destroy PROJECT_NAME=<project_name=no-name-project>
```

Be cautious when using this command, as it will irreversibly delete your project.

#### Eject Project

If you want to remove the project from the boilerplate, you can use:

```bash
make eject PROJECT_NAME=<project_name=no-name-project>
```

This command will remove the boilerplate from your project.

#### Clean Up

If you need to remove all containers and volumes, use:

```bash
make clean
```

This will help you clean up your development environment.

#### Stop Containers

To stop the containers without removing them, use:

```bash
make down
```

This command temporarily stops your development environment.

### Additional Notes

- This project is configured with Jetstream, including support for teams.
- The project environment file is initially copied from `envs/default_laravel.env` to the project root as `.env`.

## License

This package is licensed under the MIT License. See the [LICENSE](LICENSE.md) file for details.

## Contributing

Thank you for your interest in contributing! Feel free to PR bug fixes, optimisations and documentation improvements. For new functions or functional alterations, please open an issue for discussion prior to submitting a PR.
