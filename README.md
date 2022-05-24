# Round Image 

This library is developed to provide rounded image corners and oval shaped image implemented using extended typescript.

## Installation

Install [dev eco studio](https://developer.harmonyos.com/cn/develop/deveco-studio#download_beta_openharmony) and open the project. 


## Usage

Displaying of images can be circular or oval.
You need to import the following:
```ets
import { RoundImage, OvalImage } from '@ohos/libroundimage'
```

## Compatibility
Supports OpenHarmony API version 8

## Examples

### Round Image
RoundImage({
          borderRadius: $borderRadius,
          needBorder: true,
          borderWidth: 10,
          imageWidth: $imageWidth,
          imageHeight: $imageHeight,
          imageResource: $imageResource,
          objectFit: $objectFit
        })

### Oval Image
OvalImage({
          imageSource: $imageSource,
          imageWidth: $ovalImageWidth,
          imageHeight: $ovalImageHeight,
          borderWidth: 5,
          borderColorStr: '#00FFFF',
          needBorder: true
        })

## Code Contribution
If you find any problems during usage, you can submit an [Issue](https://github.com/Applib-OpenHarmony/RoundedImageView/issues) to us. Of course, we also welcome you to send us [PR](https://github.com/Applib-OpenHarmony/RoundedImageView/pulls).
Please enjoy and participate in open source freely.

## Open Source License

Licensed under [Apache-2.0 license](LICENSE.txt)

## Reference:

Design by : Sushanta Senapati