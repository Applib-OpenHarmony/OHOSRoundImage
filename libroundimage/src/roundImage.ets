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

import RoundImageModel from "./RoundImageModel"
import OvalImageModel from "./OvalImageModel"

@Component
export struct RoundImage {
  @State model: RoundImageModel.Model = new RoundImageModel.Model();
  private onClick: (() => void)

  aboutToAppear() {
    if (!this.model.needBorder) {
      this.model.borderWidth = 0
    }
  }

  build() {
    Image(this.model.srcPath)
      .objectFit(this.model.objectFit)
      .width(this.model.imageWidth)
      .height(this.model.imageHeight)
      .borderRadius(this.model.borderRadius)
      .border({ width: this.model.borderWidth, color: this.model.borderColor })
      .margin({
        top: this.model.marginTop,
        bottom: this.model.marginBottom,
        left: this.model.marginLeft,
        right: this.model.marginRight
      })
      .padding({
        top: this.model.paddingTop,
        bottom: this.model.paddingBottom,
        left: this.model.paddingLeft,
        right: this.model.paddingRight
      })
      .onClick(() => {
        if (this.model.clickListener !== null) {
          this.model.clickListener.onClick()
        } else {
          this.onClick()
        }
      })
  }
}

@Component
export struct OvalImage {
  @State model: OvalImageModel.Model = new OvalImageModel.Model();
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  private img: ImageBitmap
  private onClick: (() => void)

  build() {
    Canvas(this.context)
      .width(this.model.imageWidth)
      .height(this.model.imageHeight)
      .onReady(() => {
        this.img = new ImageBitmap(this.model.srcPath)
        this.context.imageSmoothingEnabled = false
        var r = { x: 0, y: 0, w: this.model.imageWidth, h: this.model.imageHeight };
        this.context.save();
        this.context.beginPath();
        this.context.moveTo(r.x + r.w, r.y + 0.5 * r.h);
        this.context.bezierCurveTo(r.x + r.w, r.y + 0.25 * r.h, r.x + 0.75 * r.w, r.y, r.x + 0.5 * r.w, r.y);
        this.context.bezierCurveTo(r.x + 0.25 * r.w, r.y, r.x, r.y + 0.25 * r.h, r.x, r.y + 0.5 * r.h);
        this.context.bezierCurveTo(r.x, r.y + 0.75 * r.h, r.x + 0.25 * r.w, r.y + r.h, r.x + 0.5 * r.w, r.y + r.h);
        this.context.bezierCurveTo(r.x + 0.75 * r.w, r.y + r.h, r.x + r.w, r.y + 0.75 * r.h, r.x + r.w, r.y + 0.5 * r.h);

        this.context.closePath();
        this.context.clip();
        if (this.model.needBorder) {
          this.context.lineWidth = this.model.borderWidth;
          this.context.strokeStyle = this.model.borderColor;
        }

        this.context.drawImage(this.img, r.x, r.y, r.w, r.h);
        if (this.model.needBorder) {
          this.context.stroke();
        }
        this.context.restore();
      })
      .aspectRatio(0)
      .margin({
        top: this.model.marginTop,
        bottom: this.model.marginBottom,
        left: this.model.marginLeft,
        right: this.model.marginRight
      })
      .padding({
        top: this.model.paddingTop,
        bottom: this.model.paddingBottom,
        left: this.model.paddingLeft,
        right: this.model.paddingRight
      })
      .onClick(() => {
        if (this.model.clickListener !== null) {
          this.model.clickListener.onClick()
        } else {
          this.onClick()
        }
      })
  }
}

export { RoundImageModel } from "./RoundImageModel";

export { OvalImageModel } from "./OvalImageModel";

export { ClickListener } from './ClickListener'