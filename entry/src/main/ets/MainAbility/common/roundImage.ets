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

@Component
export struct RoundImage {
  @Link imageWidth: number
  @Link imageHeight: number
  @Link borderRadius: number
  @Link borderWidth: number
  @Link borderColor: number
  @Link imageResource: Resource
  @Link objectFit: ImageFit

  build() {
    Image(this.imageResource)
      .objectFit(this.objectFit)
      .width(this.imageWidth)
      .height(this.imageHeight)
      .borderRadius(this.borderRadius)
      .border({ width: this.borderWidth, color: this.borderColor })
  }
}

@Component
export struct OvalImage {
  @Link imageSource: string
  @Link imageWidth: number
  @Link imageHeight: number
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  private img: ImageBitmap

  build() {
    Canvas(this.context)
      .width(this.imageWidth).height(this.imageHeight)
      .onReady(() => {
        this.img = new ImageBitmap(this.imageSource)
        this.context.imageSmoothingEnabled = false
        var r = { x: 0, y: 0, w: this.imageWidth, h: this.imageHeight };
        this.context.save();
        this.context.beginPath();
        this.context.moveTo(r.x + r.w, r.y + 0.5 * r.h);
        this.context.bezierCurveTo(r.x + r.w, r.y + 0.25 * r.h, r.x + 0.75 * r.w, r.y, r.x + 0.5 * r.w, r.y);
        this.context.bezierCurveTo(r.x + 0.25 * r.w, r.y, r.x, r.y + 0.25 * r.h, r.x, r.y + 0.5 * r.h);
        this.context.bezierCurveTo(r.x, r.y + 0.75 * r.h, r.x + 0.25 * r.w, r.y + r.h, r.x + 0.5 * r.w, r.y + r.h);
        this.context.bezierCurveTo(r.x + 0.75 * r.w, r.y + r.h, r.x + r.w, r.y + 0.75 * r.h, r.x + r.w, r.y + 0.5 * r.h);
        this.context.closePath();
        this.context.clip();
        this.context.drawImage(this.img, r.x, r.y, r.w, r.h);
        this.context.restore();
      })
      .aspectRatio(0)
  }
}

