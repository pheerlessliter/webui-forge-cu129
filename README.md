# Stable Diffusion WebUI Forge

Stable Diffusion WebUI Forge is a platform on top of [Stable Diffusion WebUI](https://github.com/AUTOMATIC1111/stable-diffusion-webui) (based on [Gradio](https://www.gradio.app/) <a href='https://github.com/gradio-app/gradio'><img src='https://img.shields.io/github/stars/gradio-app/gradio'></a>) to make development easier, optimize resource management, speed up inference, and study experimental features.

The name "Forge" is inspired from "Minecraft Forge". This project is aimed at becoming SD WebUI's Forge.

Forge is currently based on SD-WebUI 1.10.1 at [this commit](https://github.com/AUTOMATIC1111/stable-diffusion-webui/commit/82a973c04367123ae98bd9abdf80d9eda9b910e2). (Because original SD-WebUI is almost static now, Forge will sync with original WebUI every 90 days, or when important fixes.)

News are moved to this link: [Click here to see the News section](https://github.com/lllyasviel/stable-diffusion-webui-forge/blob/main/NEWS.md)

# Quick List

[Gradio 4 UI Must Read (TLDR: You need to use RIGHT MOUSE BUTTON to move canvas!)](https://github.com/lllyasviel/stable-diffusion-webui-forge/discussions/853)

[Flux Tutorial (BitsandBytes Models, NF4, "GPU Weight", "Offload Location", "Offload Method", etc)](https://github.com/lllyasviel/stable-diffusion-webui-forge/discussions/981)

[Flux Tutorial 2 (Seperated Full Models, GGUF, Technically Correct Comparison between GGUF and NF4, etc)](https://github.com/lllyasviel/stable-diffusion-webui-forge/discussions/1050)

[Forge Extension List and Extension Replacement List (Temporary)](https://github.com/lllyasviel/stable-diffusion-webui-forge/discussions/1754)

[How to make LoRAs more precise on low-bit models; How to Skip" Patching LoRAs"; How to only load LoRA one time rather than each generation; How to report LoRAs that do not work](https://github.com/lllyasviel/stable-diffusion-webui-forge/discussions/1038)

[Report Flux Performance Problems (TLDR: DO NOT set "GPU Weight" too high! Lower "GPU Weight" solves 99% problems!)](https://github.com/lllyasviel/stable-diffusion-webui-forge/discussions/1181)

[How to solve "Connection errored out" / "Press anykey to continue ..." / etc](https://github.com/lllyasviel/stable-diffusion-webui-forge/discussions/1474)

[(Save Flux BitsandBytes UNet/Checkpoint)](https://github.com/lllyasviel/stable-diffusion-webui-forge/discussions/1224#discussioncomment-10384104)

[LayerDiffuse Transparent Image Editing](https://github.com/lllyasviel/stable-diffusion-webui-forge/discussions/854)

[Tell us what is missing in ControlNet Integrated](https://github.com/lllyasviel/stable-diffusion-webui-forge/discussions/932)

[(Policy) Soft Advertisement Removal Policy](https://github.com/lllyasviel/stable-diffusion-webui-forge/discussions/1286)

(Flux BNB NF4 / GGUF Q8_0/Q5_0/Q5_1/Q4_0/Q4_1 are all natively supported with GPU weight slider and Quene/Async Swap toggle and swap location toggle. All Flux BNB NF4 / GGUF Q8_0/Q5_0/Q4_0 have LoRA support.)

# Installing Forge

## Advanced Install

### Prerequisites
Python 3.10.6: https://www.python.org/ftp/python/3.10.6/python-3.10.6-amd64.exe

### Possibly Needed, depending on your environment
Visual Studio Community 2022: https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=Community&channel=Release&version=VS2022&source=VSLandingPage&passive=false&cid=2030

Visual Studio Build Tool 2022 (select Desktop development with C++ during install, or modify after install to include): https://aka.ms/vs/17/release/vs_BuildTools.exe

Cargo: https://win.rustup.rs/x86_64

### Building from source
* Clone the repo into a working directory

  * `git clone git@github.com:pheerlessliter/webui-forge-cu129.git`

* Navigate to the cloned webui-forge-cu129 directory and run the webui-user.bat file

  * If you only want to run locally, make sure your windows Firewall settings are set to a private network, otherwise you'll get errors at the end of the python install

NOTES: 

* If you run into any issues, or just want a clean install, delete the tmp, venv, and repositories folders and re-run webui-user.bat file. 

* There's a current bug where you may have to run the webui-user.bat file twice on the first run to get the website to properly open without using remote connectivity.

### Easier run method (Tested on Windows only currently)
* Download the release parts from here and extract the first one (make sure you save them all to the same directory so they will reconstruct): https://github.com/pheerlessliter/webui-forge-cu129/releases/tag/1.0.0

* Unpack the 7zip file into your destination of choice

* Run the update.bat file

* Run the run.bat file (The first run may take upwards of 10 minutes to finish setting up. Be patient!)

### Previous Versions

You can download previous versions [here](https://github.com/lllyasviel/stable-diffusion-webui-forge/discussions/849).

# Forge Status

Based on manual test one-by-one:

| Component                                           | Status                                      | Last Test    |
|-----------------------------------------------------|---------------------------------------------|--------------|
| Basic Diffusion                                     | Normal                                      | 2024 Aug 26  |
| GPU Memory Management System                        | Normal                                      | 2024 Aug 26  |
| LoRAs                                               | Normal                                      | 2024 Aug 26  |
| All Preprocessors                                   | Normal                                      | 2024 Aug 26  |
| All ControlNets                                     | Normal                                      | 2024 Aug 26  |
| All IP-Adapters                                     | Normal                                      | 2024 Aug 26  |
| All Instant-IDs                                     | Normal                                      | 2024 July 27 |
| All Reference-only Methods                          | Normal                                      | 2024 July 27 |
| All Integrated Extensions                           | Normal                                      | 2024 July 27 |
| Popular Extensions (Adetailer, etc)                 | Normal                                      | 2024 July 27 |
| Gradio 4 UIs                                        | Normal                                      | 2024 July 27 |
| Gradio 4 Forge Canvas                               | Normal                                      | 2024 Aug 26  |
| LoRA/Checkpoint Selection UI for Gradio 4           | Normal                                      | 2024 July 27 |
| Photopea/OpenposeEditor/etc for ControlNet          | Normal                                      | 2024 July 27 |
| Wacom 128 level touch pressure support for Canvas   | Normal                                      | 2024 July 15 |
| Microsoft Surface touch pressure support for Canvas | Broken, pending fix                         | 2024 July 29 |
| ControlNets (Union)                                 | Not implemented yet, pending implementation | 2024 Aug 26  |
| ControlNets (Flux)                                  | Not implemented yet, pending implementation | 2024 Aug 26  |
| API endpoints (txt2img, img2img, etc)               | Normal, but pending improved Flux support   | 2024 Aug 29  |
| OFT LoRAs                                           | Broken, pending fix                         | 2024 Sep 9   |

Feel free to open issue if anything is broken and I will take a look every several days. If I do not update this "Forge Status" then it means I cannot reproduce any problem. In that case, fresh re-install should help most.

# UnetPatcher

Below are self-supported **single file** of all codes to implement FreeU V2.

See also `extension-builtin/sd_forge_freeu/scripts/forge_freeu.py`:

```python
import torch
import gradio as gr

from modules import scripts


def Fourier_filter(x, threshold, scale):
    # FFT
    x_freq = torch.fft.fftn(x.float(), dim=(-2, -1))
    x_freq = torch.fft.fftshift(x_freq, dim=(-2, -1))

    B, C, H, W = x_freq.shape
    mask = torch.ones((B, C, H, W), device=x.device)

    crow, ccol = H // 2, W // 2
    mask[..., crow - threshold:crow + threshold, ccol - threshold:ccol + threshold] = scale
    x_freq = x_freq * mask

    # IFFT
    x_freq = torch.fft.ifftshift(x_freq, dim=(-2, -1))
    x_filtered = torch.fft.ifftn(x_freq, dim=(-2, -1)).real

    return x_filtered.to(x.dtype)


def patch_freeu_v2(unet_patcher, b1, b2, s1, s2):
    model_channels = unet_patcher.model.diffusion_model.config["model_channels"]
    scale_dict = {model_channels * 4: (b1, s1), model_channels * 2: (b2, s2)}
    on_cpu_devices = {}

    def output_block_patch(h, hsp, transformer_options):
        scale = scale_dict.get(h.shape[1], None)
        if scale is not None:
            hidden_mean = h.mean(1).unsqueeze(1)
            B = hidden_mean.shape[0]
            hidden_max, _ = torch.max(hidden_mean.view(B, -1), dim=-1, keepdim=True)
            hidden_min, _ = torch.min(hidden_mean.view(B, -1), dim=-1, keepdim=True)
            hidden_mean = (hidden_mean - hidden_min.unsqueeze(2).unsqueeze(3)) / (hidden_max - hidden_min).unsqueeze(2).unsqueeze(3)

            h[:, :h.shape[1] // 2] = h[:, :h.shape[1] // 2] * ((scale[0] - 1) * hidden_mean + 1)

            if hsp.device not in on_cpu_devices:
                try:
                    hsp = Fourier_filter(hsp, threshold=1, scale=scale[1])
                except:
                    print("Device", hsp.device, "does not support the torch.fft.")
                    on_cpu_devices[hsp.device] = True
                    hsp = Fourier_filter(hsp.cpu(), threshold=1, scale=scale[1]).to(hsp.device)
            else:
                hsp = Fourier_filter(hsp.cpu(), threshold=1, scale=scale[1]).to(hsp.device)

        return h, hsp

    m = unet_patcher.clone()
    m.set_model_output_block_patch(output_block_patch)
    return m


class FreeUForForge(scripts.Script):
    sorting_priority = 12  # It will be the 12th item on UI.

    def title(self):
        return "FreeU Integrated"

    def show(self, is_img2img):
        # make this extension visible in both txt2img and img2img tab.
        return scripts.AlwaysVisible

    def ui(self, *args, **kwargs):
        with gr.Accordion(open=False, label=self.title()):
            freeu_enabled = gr.Checkbox(label='Enabled', value=False)
            freeu_b1 = gr.Slider(label='B1', minimum=0, maximum=2, step=0.01, value=1.01)
            freeu_b2 = gr.Slider(label='B2', minimum=0, maximum=2, step=0.01, value=1.02)
            freeu_s1 = gr.Slider(label='S1', minimum=0, maximum=4, step=0.01, value=0.99)
            freeu_s2 = gr.Slider(label='S2', minimum=0, maximum=4, step=0.01, value=0.95)

        return freeu_enabled, freeu_b1, freeu_b2, freeu_s1, freeu_s2

    def process_before_every_sampling(self, p, *script_args, **kwargs):
        # This will be called before every sampling.
        # If you use highres fix, this will be called twice.

        freeu_enabled, freeu_b1, freeu_b2, freeu_s1, freeu_s2 = script_args

        if not freeu_enabled:
            return

        unet = p.sd_model.forge_objects.unet

        unet = patch_freeu_v2(unet, freeu_b1, freeu_b2, freeu_s1, freeu_s2)

        p.sd_model.forge_objects.unet = unet

        # Below codes will add some logs to the texts below the image outputs on UI.
        # The extra_generation_params does not influence results.
        p.extra_generation_params.update(dict(
            freeu_enabled=freeu_enabled,
            freeu_b1=freeu_b1,
            freeu_b2=freeu_b2,
            freeu_s1=freeu_s1,
            freeu_s2=freeu_s2,
        ))

        return
```

See also [Forge's Unet Implementation](https://github.com/lllyasviel/stable-diffusion-webui-forge/blob/main/backend/nn/unet.py).

# Under Construction

WebUI Forge is now under some constructions, and docs / UI / functionality may change with updates.
