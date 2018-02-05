---
layout: post
title: "How to setup dual monitors for Ubuntu"
permalink: dual-monitor.html
---

Productivity can substantially increase with dual monitors, especially with
square ones, connected to a single machine. Given below is a do-it-yourself
for setting dual monitors in Ubuntu using Nvidia driver. For programming
purpose, I find that square monitors are more impressive than the wide-screen,
but they are slightly costlier than the equivalent wide-screen monitors. If
you are buying both the monitors at the same time, then it is easy to buy the
same model. But if you are adding another monitor to the current one. Then
stick with same specification, like 17" 1280x1024 resolution.

Normally Graphics card come with DVI output, forcing you to buy monitors
with DVI connectivity. Since we are buying for programming purpose, it is
better to stick with VGA (thus saving some money) and buy a DVI-VGA adapter.
But if you are a multimedia geek, then you might want to use DVI monitors.

Graphics Card
-------------

If the purpose of the Video Card is only to provide dual monitor support then,
I would suggest a basic model from Nvidia, 8400 GS. But these days Nvidia is
promoting lots of high performance computing on it GPU and being a programmer
it is only natural to buy one which supports CUDA. In any case, the driver
support from Nvidia is amazing. And that brings us to installing the driver
for our new Graphics Card.

Linux Drivers
-------------

Drivers can be installed via the distributions package manager, like for
Debian, `nvidia-glx` or `nvidia-glx-new` can be installed
or the drivers can be installed from [Nvidia Site][Nvidia-Site]
Download the appropriate driver installation file, (which normally ends with
'.run') and execute them

```bash
    $ sudo sh <nvidia-driver-installation-file>.run
```

Follow the instruction and install the driver. Restart the system. And you
will find that when X server is loaded NVIDIA splash screen will be displayed.

But before that you will need to resolve the 'primary graphics card' in your
BIOS settings.

BIOS setting
------------

Verify with your BIOS manual (motherboard vendor manual) to configure Primary
Graphics Card. Normally the configuration will be similar to the configuration
for Primary Boot Device.

Once the Primary Graphics Card configuration is done successfully, you will
be able to see the Graphics Card's BIOS splash as the first screen while
system booting.

Enabling Dual monitors
----------------------

After rebooting and logging in, go to ::

    system -> Nvidia X Server Setting

And configure for dual monitor by Enabling `TwinView` in 'X server Display
configuration'

[Nvidia-site]: http://nvidia.com/page/drivers.html
