@Component
export default struct ToDoItem {
  private content?: string
  @State isComplete: boolean = false

  @Builder
  labelIcon(icon: ResourceStr) {
    Image(icon)
      .objectFit(ImageFit.Contain)
      .width(28)
      .height(28)
      .margin(20)
  }

  build() {
    Row() {
      if (this.isComplete) {
        this.labelIcon($r('app.media.ic_ok'))
      } else {
        this.labelIcon($r('app.media.ic_default'))
      }

      Text(this.content)
        .fontSize(20)
        .fontWeight(500)
        .opacity(this.isComplete ? 0.4 : 1)
        .decoration({
          type: this.isComplete
            ? TextDecorationType.LineThrough
            : TextDecorationType.None
        })
    }
    .borderRadius(24)
    .backgroundColor(Color.White)
    .width("90%")
    .height(64)
    .onClick(() => {
      this.isComplete = !this.isComplete
    })
  }
}