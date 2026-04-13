# Pelican Java 21 GraalVM Image

Small Docker image for Pelican/Pterodactyl Minecraft servers using GraalVM Community JDK 21.

## What it is

- Base image: `ghcr.io/graalvm/jdk-community:21`
- Runtime: standard JVM with Graal JIT
- Intended use: Java 21 Minecraft servers on Pelican or Pterodactyl

This is not a GraalVM native-image build. It is a normal JVM container, which is the correct setup for Paper, Purpur, Velocity, and most Java server jars.

## Files

- `Dockerfile`: image definition
- `entrypoint.sh`: runs the panel-provided `STARTUP` command
- `.github/workflows/publish.yml`: publishes the image to GitHub Container Registry

## Publish to GitHub

1. Create a new GitHub repository, for example `pelican-java21-graalvm`.
2. Push this folder to that repository.
3. In GitHub, open `Settings` -> `Actions` -> `General` and allow workflows if needed.
4. Push to `main` or create a tag like `v1.0.0`.

The workflow publishes to:

```text
ghcr.io/<your-github-username>/pelican-java21-graalvm:latest
ghcr.io/<your-github-username>/pelican-java21-graalvm:21
ghcr.io/<your-github-username>/pelican-java21-graalvm:<git-tag>
```

## Use in Pelican

Set the Docker image to:

```text
ghcr.io/<your-github-username>/pelican-java21-graalvm:latest
```

## Example startup

For modern Paper/Purpur on Java 21, start simple first:

```bash
java -Xms4G -Xmx4G -jar server.jar nogui
```

Paper currently recommends trying Java 21+ without extra flags before adding tuning flags.
