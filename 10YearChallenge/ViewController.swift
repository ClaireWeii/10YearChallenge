//
//  ViewController.swift
//  10YearChallenge
//
//  Created by Wei Pan on 2022/10/2.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var autoPlaySwitch: UISwitch!
    
    //讀取系統時間
    let dateFormatter = DateFormatter()
    
    //照片 Array
    let img = [
    "201709", "201711", "201712", "201801", "201802", "201803", "201805", "201806", "201807", "201808", "201809", "201812", "201905", "201909", "201912", "202001", "202004", "202012", "202104", "202106", "202112", "202201", "202207"
    ]
    
    //標題 Array
    let label = [
        "小Dobby來到這世界了", "第一次跟著媽媽回家", "第一次生病看醫生", "第一次靠著抱枕睡著", "第一次拍照看鏡頭", "第一次立起耳朵", "第一次玩球", "第一次高興到咪咪眼", "第一次笑到變成海狗的樣子", "第一次表演啾咪的表情", "第一次出遠門", "第一次過聖誕節", "第一次被拍到跟媽媽握手的照片", "第一次靠著媽媽賴床", "第一次打扮得像個紳士", "第一次吃草莓", "第一次靠著玩具睡著", "第一次收到聖誕禮盒", "第一次為戴頭套而感到憂鬱", "第一次自己乖乖的等看醫生", "第一次泡牛奶浴", "第一次讓媽媽拍到傻笑的照片", "第一次吹冷氣等到蓋棉被"]
    
    var dateString : String = ""
    var imgnum = 0
    var labelnum = 0
    var slidernum = 0
    var timer:Timer?
    var sliderValue: Float = 0
    
    let player = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        background()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        
        //產生音樂在 App 裡路徑的 URL
        //利用 Bundle.main 取得 App 主要的 Bundle，也就是 App 本身的資料夾，透過呼叫 function url(forResource:withExtension:) 取得音檔在資料夾裡的 URL，forResource 傳入檔名，withExtension 傳入附檔名
        let fileUrl = Bundle.main.url(forResource: "your-dog-loves-you", withExtension: "mp3")!
        //利用 AVPlayerItem 生成要播放的音樂
        let playerItem = AVPlayerItem(url: fileUrl)
        //設定 player 要播放的 AVPlayerItem
        player.replaceCurrentItem(with: playerItem)
        // player開始播放音樂
        player.play()
    }
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        //取得 datePicker 的日期
        let dateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: datePicker.date)
        //取得 datePicker 的年、月、日
        var datePickeryear = dateComponents.year!
        var datePickermonth = dateComponents.month!
        var datePickerday = dateComponents.day!

        //因為只有特定日期才有照片及標題，因此用 if else 指定日期並設定照片及標題，同時也須將讓 Slider 同步
        if datePickeryear == 2017 && datePickermonth == 9 && datePickerday == 23{
            myImage.image = UIImage(named: img[0])
            titleLabel.text = label[0]
            slider.value = 0
        }else if datePickeryear == 2017 && datePickermonth == 11 && datePickerday == 23{
            myImage.image = UIImage(named: img[1])
            titleLabel.text = label[1]
            slider.value = 1
        }else if datePickeryear == 2017 && datePickermonth == 12 && datePickerday == 4{
            myImage.image = UIImage(named: img[2])
            titleLabel.text = label[2]
            slider.value = 2
        }else if datePickeryear == 2018 && datePickermonth == 1 && datePickerday == 1{
            myImage.image = UIImage(named: img[3])
            titleLabel.text = label[3]
            slider.value = 3
        }else if datePickeryear == 2018 && datePickermonth == 2 && datePickerday == 28{
            myImage.image = UIImage(named: img[4])
            titleLabel.text = label[4]
            slider.value = 4
        }else if datePickeryear == 2018 && datePickermonth == 3 && datePickerday == 13{
            myImage.image = UIImage(named: img[5])
            titleLabel.text = label[5]
            slider.value = 5
        }else if datePickeryear == 2018 && datePickermonth == 4 && datePickerday == 14{
            myImage.image = UIImage(named: img[6])
            titleLabel.text = label[6]
            slider.value = 6
        }else if datePickeryear == 2018 && datePickermonth == 5 && datePickerday == 20{
            myImage.image = UIImage(named: img[7])
            titleLabel.text = label[7]
            slider.value = 7
        }else if datePickeryear == 2018 && datePickermonth == 7 && datePickerday == 29{
            myImage.image = UIImage(named: img[8])
            titleLabel.text = label[8]
            slider.value = 8
        }else if datePickeryear == 2018 && datePickermonth == 8 && datePickerday == 26{
            myImage.image = UIImage(named: img[9])
            titleLabel.text = label[9]
            slider.value = 9
        }else if datePickeryear == 2018 && datePickermonth == 9 && datePickerday == 23{
            myImage.image = UIImage(named: img[10])
            titleLabel.text = label[10]
            slider.value = 10
        }else if datePickeryear == 2018 && datePickermonth == 12 && datePickerday == 25{
            myImage.image = UIImage(named: img[11])
            titleLabel.text = label[11]
            slider.value = 11
        }else if datePickeryear == 2019 && datePickermonth == 5 && datePickerday == 31{
            myImage.image = UIImage(named: img[12])
            titleLabel.text = label[12]
            slider.value = 12
        }else if datePickeryear == 2019 && datePickermonth == 9 && datePickerday == 20{
            myImage.image = UIImage(named: img[13])
            titleLabel.text = label[13]
            slider.value = 13
        }else if datePickeryear == 2019 && datePickermonth == 12 && datePickerday == 31{
            myImage.image = UIImage(named: img[14])
            titleLabel.text = label[14]
            slider.value = 14
        }else if datePickeryear == 2020 && datePickermonth == 1 && datePickerday == 15{
            myImage.image = UIImage(named: img[15])
            titleLabel.text = label[15]
            slider.value = 15
        }else if datePickeryear == 2020 && datePickermonth == 4 && datePickerday == 9{
            myImage.image = UIImage(named: img[16])
            titleLabel.text = label[16]
            slider.value = 16
        }else if datePickeryear == 2020 && datePickermonth == 12 && datePickerday == 25{
            myImage.image = UIImage(named: img[17])
            titleLabel.text = label[17]
            slider.value = 17
        }else if datePickeryear == 2021 && datePickermonth == 4 && datePickerday == 27{
            myImage.image = UIImage(named: img[18])
            titleLabel.text = label[18]
            slider.value = 18
        }else if datePickeryear == 2021 && datePickermonth == 6 && datePickerday == 23{
            myImage.image = UIImage(named: img[19])
            titleLabel.text = label[19]
            slider.value = 19
        }else if datePickeryear == 2021 && datePickermonth == 12 && datePickerday == 24{
            myImage.image = UIImage(named: img[20])
            titleLabel.text = label[20]
            slider.value = 20
        }else if datePickeryear == 2022 && datePickermonth == 1 && datePickerday == 1{
            myImage.image = UIImage(named: img[21])
            titleLabel.text = label[21]
            slider.value = 21
        }else if datePickeryear == 2022 && datePickermonth == 7 && datePickerday == 22{
            myImage.image = UIImage(named: img[22])
            titleLabel.text = label[22]
            slider.value = 22
        }
    }
    
    
    @IBAction func changeValueSlider(_ sender: UISlider) {
        sender.value.round()
        //sliderValue = slider.value + 1
        slidernum = Int(sender.value)
        myImage.image = UIImage(named: img[slidernum])
        titleLabel.text = label[slidernum]
        chooseImgnLabel(num1: slidernum)
    }
    
    @IBAction func autoPlaySwitch(_ sender: UISwitch) {
        //sliderValue = slider.value
        if sender.isOn{
            time()
            imgnum = slidernum
            slider.value = Float(imgnum)
            labelnum = slidernum
            slider.value = Float(labelnum)
        }else{
            timer?.invalidate()
        }
    }
    
    //利用 switch-case 與 image array 取元件的對應做連續數值判斷
    func chooseImgnLabel(num1 : Int){
        switch num1{
        case 0:
            dateString = "2017/09/23"
        case 1:
            dateString = "2017/11/23"
        case 2:
            dateString = "2017/12/04"
        case 3:
            dateString = "2018/01/01"
        case 4:
            dateString = "2018/02/28"
        case 5:
            dateString = "2018/03/13"
        case 6:
            dateString = "2018/04/14"
        case 7:
            dateString = "2018/05/20"
        case 8:
            dateString = "2018/07/29"
        case 9:
            dateString = "2018/08/26"
        case 10:
            dateString = "2018/09/23"
        case 11:
            dateString = "2018/12/25"
        case 12:
            dateString = "2019/05/31"
        case 13:
            dateString = "2019/09/20"
        case 14:
            dateString = "2019/12/31"
        case 15:
            dateString = "2020/01/15"
        case 16:
            dateString = "2020/04/09"
        case 17:
            dateString = "2020/12/25"
        case 18:
            dateString = "2021/04/27"
        case 19:
            dateString = "2021/06/23"
        case 20:
            dateString = "2021/12/24"
        case 21:
            dateString = "2022/01/01"
        case 22:
            dateString = "2022/07/22"
        default:
            dateString = "2017/09/23"
        }
        //使 datePicker 判斷的日期為 dateString 內的字串
        let date = dateFormatter.date(from: dateString)
        datePicker.date = date!
        
    }
    
    //比對陣列內的照片及標題
    func compare(){
        //如果比對到最後一照片/標題時則從第一項開始，不是則繼續跑照片/標題 num+=1
        if imgnum >= img.count,labelnum >= label.count{
            imgnum = 0
            chooseImgnLabel(num1: imgnum)
            myImage.image = UIImage(named: img[imgnum])
            labelnum = 0
            chooseImgnLabel(num1: labelnum)
            titleLabel.text = label[labelnum]
        }else{
            chooseImgnLabel(num1: imgnum)
            myImage.image = UIImage(named: img[imgnum])
            chooseImgnLabel(num1: labelnum)
            titleLabel.text = label[labelnum]
        }
        //連動Slider
        slider.value = Float(imgnum)
        imgnum += 1
        slider.value = Float(labelnum)
        labelnum += 1
    }
    
    //每次執行 compare 的時間（自動切換照片/標題的時間）
    func time(){
        timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true, block: {(timer) in self.compare()})
    }
    
    func background(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: 390, height: 844)
        gradientLayer.colors = [
        CGColor(red: 175/255, green: 115/255, blue: 74/255, alpha: 1),
        CGColor(red: 255/255, green: 250/255, blue: 241/255, alpha: 1)
        ]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }

    override func viewWillAppear(_ animated: Bool) {
        timer?.invalidate()
    }
}

