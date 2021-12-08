# DAPLink Docker Image

🐳 A Docker image to create repeatable DAPLink builds.


## Building DAPLink with this image

Pull the image version you want to use to build DAPLink:

```
docker pull ghcr.io/microbit-foundation/daplink:v1.0.0
```

Clone and navigate to the desire branch of the DAPLink project:

```
git clone https://github.com/mbedmicro/DAPLink
```

```
cd DAPLink
```

```
git checkout -b develop origin/develop
```

Build the required DAPLink project, for example for the `kl27z_microbit_if`:

```
docker run -v $(pwd):/home --rm ghcr.io/microbit-foundation/daplink:v1.0.0 python tools/progen_compile.py -t make_gcc_arm kl27z_microbit_if
```
docker run -v $(pwd):/home --rm daplink-toolchain python tools/progen_compile.py -t make_gcc_arm kl27z_microbit_if

## Building and running this image locally

```
docker build -t "daplink-toolchain" .
```

```
docker run --name daplink-toolchain-container -it --entrypoint /bin/bash daplink-toolchain
```

## DAPLink Python dependencies used

These Docker images contain the DAPLink Python dependencies pre-installed as
specified in the requirements.txt file.

This file is generated by pip installing a DAPLink requirements.txt file and
then pip freezing. This is done because the DAPLink file generally only pins a
few versions and does not include subdependencies.

More info included at the top of the [requirements.txt](requirements.txt) file.


## License

This project is under the MIT open source license. It was forked from
[carlosperate/docker-microbit-toolchain](https://github.com/carlosperate/docker-microbit-toolchain)
at commit
[2637ab7570fe77c352189249a865b3241b880d67](https://github.com/carlosperate/docker-microbit-toolchain/commit/2637ab7570fe77c352189249a865b3241b880d67).

[SPDX-License-Identifier: MIT](LICENSE.md)


## Code of Conduct

Trust, partnership, simplicity and passion are our core values we live and
breathe in our daily work life and within our projects. Our open-source
projects are no exception. We have an active community which spans the globe
and we welcome and encourage participation and contributions to our projects
by everyone. We work to foster a positive, open, inclusive and supportive
environment and trust that our community respects the micro:bit code of
conduct. Please see our [code of conduct](https://microbit.org/safeguarding/)
which outlines our expectations for all those that participate in our
community and details on how to report any concerns and what would happen
should breaches occur.
