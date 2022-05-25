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

import { RoundImage, RoundImageSource, OvalImage } from '@ohos/libroundimage'
import prompt from '@system.prompt';

@Entry
@Component
struct Index {
  @State borderRadius: number = 100
  @State borderWidth: number = 5
  @State borderColor: number = Color.Green
  @State borderColorStr: string = '#00FF00'
  @State imageWidth: number = 150
  @State imageHeight: number = 150
  @State imageWidth1: number = 75
  @State imageHeight1: number = 75
  @State borderRadius1: number = 50
  @State imageResource: Resource = $r('app.media.icon')
  @State imageResource1: Resource = $r('app.media.test1')
  @State objectFit: ImageFit = ImageFit.Fill
  @State objectFit1: ImageFit = ImageFit.Cover
  @State imageSource: string = '/common/images/photo3.jpg'
  @State imageSource1: string = '/common/images/user.png'
  @State imageSource2: string = '/common/images/photo2.jpg'
  @State ovalImageWidth: number = 200
  @State ovalImageHeight: number = 150
  @State ovalImageWidth1: number = 50
  @State ovalImageHeight1: number = 100
  @State showRounded: boolean = true
  @State showOval: boolean = false

  build() {
    Row() {
      Column() {
        if (this.showRounded) {
          RoundImage({
            borderRadius: $borderRadius,
            needBorder: true,
            borderWidth: 10,
            borderColorStr: '#0000FF',
            imageWidth: $imageWidth,
            imageHeight: $imageHeight,
            imageResource: $imageResource,
            objectFit: $objectFit,
            onClick: () => {
              prompt.showToast({
                message: 'Round Image is clicked'
              })
            }
          })
          RoundImage({
            borderRadius: $borderRadius,
            needBorder: true,
            borderWidth: 10,
            imageWidth: $imageWidth,
            imageHeight: $imageHeight,
            imageResource: $imageResource1,
            objectFit: $objectFit1,
            onClick: () => {
              prompt.showToast({
                message: 'Round Image is clicked'
              })
            }
          })
          RoundImageSource({
            borderRadius: $borderRadius1,
            needBorder: true,
            borderWidth: 5,
            imageWidth: $imageWidth1,
            imageHeight: $imageHeight1,
            imageSource: '/common/images/photo4.jpg',
            objectFit: $objectFit1,
            onClick: () => {
              prompt.showToast({
                message: 'Round Image is clicked'
              })
            }
          })
        }
        if (this.showOval) {
          OvalImage({
            imageSource: $imageSource2,
            imageWidth: $ovalImageWidth,
            imageHeight: $ovalImageHeight,
            borderWidth: 5,
            borderColorStr: '#00FFFF',
            needBorder: true,
            onClick: () => {
              prompt.showToast({
                message: 'Oval Image is clicked'
              })
            }
          })
          OvalImage({
            imageSource: $imageSource,
            imageWidth: $ovalImageWidth1,
            imageHeight: $ovalImageHeight1,
            borderWidth: 5,
            borderColorStr: '#0000FF',
            needBorder: true,
            onClick: () => {
              prompt.showToast({
                message: 'Oval Image is clicked'
              })
            }
          })
          OvalImage({
            imageSource: $imageSource1,
            imageWidth: $ovalImageWidth1,
            imageHeight: $ovalImageHeight1,
            borderWidth: 3,
            borderColorStr: '#00FFFF',
            needBorder: false,
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