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

import  { RoundImage, OvalImage } from '../common/roundImage'

@Entry
@Component
struct Index {
  @State borderRadius: number = 75
  @State borderWidth: number = 10
  @State borderColor: number = Color.Green
  @State imageWidth: number = 150
  @State imageHeight: number = 150
  @State imageResource: Resource = $r('app.media.icon')
  @State objectFit: ImageFit = ImageFit.Contain
  @State imageSource: string = '/common/images/test1.jpg'

  @State ovalImageWidth: number = 200
  @State ovalImageHeight: number = 150



  build() {
    Row() {
      Column() {
        RoundImage({
          borderRadius: $borderRadius,
          borderWidth: $borderWidth,
          borderColor: $borderColor,
          imageWidth: $imageWidth,
          imageHeight: $imageHeight,
          imageResource: $imageResource,
          objectFit: $objectFit
        })
        OvalImage({
          imageSource: $imageSource,
          imageWidth: $ovalImageWidth,
          imageHeight: $ovalImageHeight
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}