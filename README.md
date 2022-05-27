# Round Image View

This library is developed to provide rounded image corners and oval shaped image implemented using extended typescript.

## Installation
```
npm install @ohos/libroundimage --save
```

## Instructions for use

### Displaying of images can be circular or oval.
   You need to import the following:
```ets
import { RoundImage, OvalImage, RoundImageModel, OvalImageModel, ClickListener } from '@ohos/libroundimage'
```
For RoundImage
Initialize the model data
```
model: RoundImageModel.Model = new RoundImageModel.Model();
```
Call the corresponding function of the Model
```
    this.model.reset()
    this.model.setSrcPath(this.imageResource)
    this.model.setBorderRadius(this.borderRadius)
    this.model.setNeedBorder(true)
    this.model.setBorderWidth(10)
    this.model.setBorderColor('#0000FF')
    this.model.setImageWidth(this.imageWidth)
    this.model.setImageHeight(this.imageHeight)
    this.model.setObjectFit(this.objectFit)
    this.model.setClickListener({
      onClick() {
        console.info('onClick event reached app')
        prompt.showToast({
          message: 'Round Image is clicked'
        })
      }
    })
```
For OvalImage
Initialize the model data
```
model_oval: OvalImageModel.Model = new OvalImageModel.Model();
```
Call the corresponding function of the Model
```
    this.model_oval.reset()
    this.model_oval.setSrcPath(this.imageSource1)
    this.model_oval.setImageWidth(this.ovalImageWidth)
    this.model_oval.setImageHeight(this.ovalImageHeight)
    this.model_oval.setNeedBorder(true)
    this.model_oval.setBorderWidth(5)
    this.model_oval.setBorderColor('#00FFFF')
    this.model_oval.setMarginTop(0)
    this.model_oval.setMarginBottom(0)
    this.model_oval.setMarginLeft(0)
    this.model_oval.setMarginRight(0)
```

##Interface Description
``
model: RoundImageModel.Model = new RoundImageModel.Model();
``
``
model_oval: OvalImageModel.Model = new OvalImageModel.Model();
``
1. Reset `model.reset()`
2. Set Image source path `model.setSrcPath()`
3. Set Image width `model.setImageWidth()`
4. Set Image height `model.setImageHeight()`
5. Whether a border is required `model.setNeedBorder()`
6. Set border width `model.setBorderWidth()`
7. Set border color `model.setBorderColor()`
8. Set border radius `model.setBorderRadius()`
9. Set the click event `model.setClickListener()`
10. Set the objectFit `model.setObjectFit()`

## Directory Structure
````
|---- RoundImageView
|     |---- libroundimage  #round image library
|           |---- src
|                 |---- clickListener.ets
|                 |---- OvalImageModel.ets
|                 |---- roundImage.ets
|                 |---- RoundImageModel.ets
|     |---- entry  #Sample Code Folder
|           |---- src
|                 |---- main
|                       |---- MainAbility
|                             |---- pages 
|                                   |---- index..ets  
````
## Compatibility
Supports OpenHarmony API version 8

## Code Contribution
If you find any problems during usage, you can submit an [Issue](https://github.com/Applib-OpenHarmony/RoundedImageView/issues) to us. Of course, we also welcome you to send us [PR](https://github.com/Applib-OpenHarmony/RoundedImageView/pulls).
Please enjoy and participate in open source freely.

## Open Source License

Licensed under [Apache-2.0 license](LICENSE)

## Reference:

Design by : Sushanta Senapati