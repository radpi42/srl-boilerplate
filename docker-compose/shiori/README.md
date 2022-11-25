# docker setup and run

first make directory to work in

`mkdir shiori`

then run the following to start up a container

```bash
docker run -d --rm --name shiori -p 8080:8080 -v $(pwd):/shiori ghcr.io/go-shiori/shiori
```

Before it will work the before you try and access it run the database migration by using the following command

```bash
docker run --rm -v $(pwd):/shiori ghcr.io/go-shiori/shiori migrate
```

once that is done you can log in with the following default login

shiori

gopher

once logged in simply change the password and you are off to the races
