import ToDoItem from '../ToDoItem'

@CustomDialog
struct CustomDialogExample {
  @State src:string=''
  action?:(text:string)=>void
  controller: CustomDialogController
  // confirm: (text:string)=> void

  build() {
    Column() {
      TextInput()
        .fontSize(20)
        .margin({ top: 10, bottom: 10 })
        .onChange((value:string)=>{
          this.src=value
        })
      Button('确定').onClick((event: ClickEvent) => {
        if(this.action) {
          this.action(this.src)
        }
        this.controller.close()
      })
    }
  }
}

@Entry
@Component
struct ToDoListPage {
  @State private totalTasks: Array<string> = []

  // Add(str:string){
  //   this.totalTasks.push(str)
  // }

  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample({
      src:'',
      action:(str:string)=>{
        this.totalTasks.push(str)
      }
    }),
  })


  build() {
    Column({ space: 16 }) {
      Text("待办")
        .fontSize(28)
        .fontWeight(FontWeight.Bold)
        .lineHeight(33)
        .width("80%")
        .margin({
          top: 24,
          bottom: 12
        })
        .textAlign(TextAlign.Start)

      ForEach(this.totalTasks, (item: string) => {
        ToDoItem({ content: item })
      }
        // , (item: string) => JSON.stringify(item)
      )
      Button('add').onClick((event: ClickEvent) => {
        // this.Add('早餐')
        this.dialogController.open()
      })
        .position({x:'70%',y:'80%'})
    }
    .width("100%")
    .height("100%")
    .backgroundColor("#F1F3F5")
  }
}