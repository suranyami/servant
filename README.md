# Servant

Backend server using:

* GraphQL
* JWT Authentication via Guardian

## Setup

Install `direnv`:

```
brew install direnv
```

Add this to your `.zlogin` or `.zshrc` file (if you use `zsh`):

```
eval "$(direnv hook zsh)"
```

Then cd into the project dir and:

```
cp .envrc.sample .env
direnv allow .
```

This will load the environment variables like `SECRET_KEY` and make them
available to the server.

## Updated githooks
