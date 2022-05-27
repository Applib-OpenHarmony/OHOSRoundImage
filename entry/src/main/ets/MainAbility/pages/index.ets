/*
 * Copyright (c) 2022 Application Library Engineering Group.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { RoundImage, OvalImage, RoundImageModel, OvalImageModel, ClickListener } from '@ohos/libroundimage'
import prompt from '@system.prompt';

@Entry
@Component
struct Index {
  model: RoundImageModel.Model = new RoundImageModel.Model();
  model_second: RoundImageModel.Model = new RoundImageModel.Model();
  model_third: RoundImageModel.Model = new RoundImageModel.Model();
  model_oval: OvalImageModel.Model = new OvalImageModel.Model();
  model_oval_second: OvalImageModel.Model = new OvalImageModel.Model();
  model_oval_third: OvalImageModel.Model = new OvalImageModel.Model();
  @State borderRadius: number = 100
  @State borderColor: number = Color.Green
  @State borderColorStr: string = '#00FF00'
  @State imageWidth: number = 150
  @State imageHeight: number = 150
  @State imageWidth1: number = 75
  @State imageHeight1: number = 75
  @State borderRadius1: number = 50
  @State imageResource: Resource = $r('app.media.icon')
  @State imageResource1: Resource = $r('app.media.test1')
  @State objectFit: ImageFit = ImageFit.Contain
  @State objectFit1: ImageFit = ImageFit.Fill
  @State imageSource: string = '/common/images/test1.jpg'
  @State imageSource1: string = '/common/images/user.png'
  @State imageSource2: string = '/common/images/photo2.jpg'
  @State ovalImageWidth: number = 200
  @State ovalImageHeight: number = 150
  @State ovalImageWidth1: number = 50
  @State ovalImageHeight1: number = 100
  @State showRounded: boolean = true
  @State showOval: boolean = false

  public aboutToAppear(): void {
    this.updateModelForFirst()
    this.updateModelForSecond()
    this.updateModelForThird()
    this.updateModelOvalForFirst()
    this.updateModelOvalForSecond()
    this.updateModelOvalForThird()
  }

  updateModelForFirst() {
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
  }

  updateModelForSecond() {
    this.model_second.reset()
    this.model_second.setSrcPath(this.imageResource1)
    this.model_second.setBorderRadius(100)
    this.model_second.setNeedBorder(true)
    this.model_second.setBorderWidth(5)
    this.model_second.setImageWidth(this.imageWidth)
    this.model_second.setImageHeight(this.imageHeight)
    this.model_second.setObjectFit(this.objectFit1)
  }

  updateModelForThird() {
    this.model_third.reset()
    this.model_third.setSrcPath('/common/images/test1.jpg')
    this.model_third.setBorderRadius(this.borderRadius1)
    this.model_third.setNeedBorder(false)
    this.model_third.setBorderWidth(5)
    this.model_third.setImageWidth(this.imageWidth1)
    this.model_third.setImageHeight(this.imageHeight1)
    this.model_third.setObjectFit(this.objectFit1)
    this.model_third.setClickListener({
      onClick() {
        console.info('onClick event reached app')
        prompt.showToast({
          message: 'Round Image is clicked'
        })
      }
    })
  }

  updateModelOvalForFirst() {
    this.model_oval.reset()
    this.model_oval.setSrcPath(this.imageSource2)
    this.model_oval.setImageWidth(this.ovalImageWidth)
    this.model_oval.setImageHeight(this.ovalImageHeight)
    this.model_oval.setNeedBorder(true)
    this.model_oval.setBorderWidth(5)
    this.model_oval.setBorderColor('#00FFFF')
    this.model_oval.setMarginTop(0)
    this.model_oval.setMarginBottom(0)
    this.model_oval.setMarginLeft(0)
    this.model_oval.setMarginRight(0)
  }

  updateModelOvalForSecond() {
    this.model_oval_second.reset()
    this.model_oval_second.setSrcPath(this.imageSource)
    this.model_oval_second.setImageWidth(this.ovalImageWidth1)
    this.model_oval_second.setImageHeight(this.ovalImageHeight1)
    this.model_oval_second.setNeedBorder(true)
    this.model_oval_second.setBorderWidth(5)
    this.model_oval_second.setBorderColor('#0000FF')
    this.model_oval_second.setClickListener({
      onClick() {
        console.info('onClick event reached app')
        prompt.showToast({
          message: 'Oval Image is clicked'
        })
      }
    })
  }

  updateModelOvalForThird() {
    this.model_oval_third.reset()
    this.model_oval_third.setSrcPath(this.imageSource1)
    this.model_oval_third.setImageWidth(this.ovalImageWidth1)
    this.model_oval_third.setImageHeight(this.ovalImageHeight1)
    this.model_oval_third.setNeedBorder(false)
    this.model_oval_third.setBorderWidth(3)
    this.model_oval_third.setBorderColor('#00FFFF')
  }

  build() {
    Row() {
      Column() {
        if (this.showRounded) {
          RoundImage({
            model: this.model
          })
          RoundImage({
            model: this.model_second,
            onClick: () => {
              prompt.showToast({
                message: 'Round Image is clicked'
              })
            }
          })
          RoundImage({
            model: this.model_third
          })
        }
        if (this.showOval) {
          OvalImage({
            model: this.model_oval,
            onClick: () => {
              prompt.showToast({
                message: 'Oval Image is clicked'
              })
            }
          })
          OvalImage({
            model: this.model_oval_second
          })
          OvalImage({
            model: this.model_oval_third,
            onClick: () => {
              prompt.showToast({
                message: 'Oval Image is clicked'
              })
            }
          })
        }

        Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceAround }) {
          Button($r("app.string.round_image"), { type: ButtonType.Normal, stateEffect: true })
            .borderRadius(8)
            .backgroundColor(0x317aff)
            .width(130)
            .onClick((event: ClickEvent) => {
              this.showOval = false;
              this.showRounded = true;
            })
          Button($r("app.string.oval_image"), { type: ButtonType.Normal, stateEffect: true })
            .borderRadius(8)
            .backgroundColor(0x317aff)
            .width(130)
            .onClick((event: ClickEvent) => {
              this.showOval = true;
              this.showRounded = false;
            })
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}