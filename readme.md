# LER Docker
This repository the docker image to be used for programming on FRC team 2708, Lake Effect Robotics.

The image is [available on Docker Hub](https://hub.docker.com/repository/docker/gregk27/ler-programming/general). Tags are provided for all WPILib verions since 2020. Tags with only a year will use the most recent version for that year.

## Image
The image is built from the `docker/dev-environments-java` image for compatibility with docker development evironments. Vim, JDK-11, and Gradle are also included. Any files placed in the deploy folder will be placed in `/frc/` when building.

Git is configured with the generic team user. This is overrident by docker dev environments, so `/frc/git-setup.sh` should be run when first creating the container in this case.

## Post-Commit Hook

The image comes bundled with a post-commit hook. After each commit this hook will re-author the commit to a selected user. This is to help connect team members to their commits without needting to log in/out. Users can be added in `users.csv` in the format `name,username,email`.

## Building

The image is build for all known versions of WPILib automatically on push to master. This process can be performed locally using `build.sh`. Versions are provided in `versions.txt` in the format `year,newestVersion`. Tags will automatically be made for all versions less than newestVersion.