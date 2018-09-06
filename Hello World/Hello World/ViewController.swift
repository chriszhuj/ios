//
//  ViewController.swift
//  Hello World
//
//  Created by 衰公 on 2018/9/4.
//  Copyright © 2018年 chrisz. All rights reserved.
//

import UIKit

var tip = 0
class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate, UISearchBarDelegate {

    override func viewDidLoad() {
        // Do any additional setup after loading the view, typically from a nib.
        super.viewDidLoad()
        tip+=1
        print("init:\(tip)")
        
        let scrollView = UIScrollView(frame: self.view.frame)
        
        let label=UILabel(frame: CGRect(x: 40, y: 100, width: 280, height: 150))
        label.text = "Hello World By Code.It can wrapping by word,act. it alse can use other modes."
        label.backgroundColor=UIColor.red
        label.font=UIFont.systemFont(ofSize: 23)
        label.textColor=UIColor.white
        label.textAlignment = .center
        label.shadowColor=UIColor.green
        label.shadowOffset=CGSize(width: 10, height: 10)
        label.numberOfLines=0
        label.lineBreakMode=NSLineBreakMode.byWordWrapping
        scrollView.addSubview(label)
        
        let button=UIButton(type: .system)
        button.frame=CGRect(x: 40, y: 300, width: 100, height: 20)
        button.backgroundColor=UIColor.red
        button.setTitle("Click me!", for: .normal)
        button.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        scrollView.addSubview(button)
        
        let costomerButton=UIButton(type: .custom)
        costomerButton.frame=CGRect(x: 150, y: 300, width: 100, height: 20)
        costomerButton.setBackgroundImage(UIImage(named: "WechatIMG74"),for:.normal)
        scrollView.addSubview(costomerButton)
        
        let roundButton = UIButton(type: .custom)
        roundButton.frame = CGRect(x: 260, y: 300, width: 100, height: 20)
        roundButton.backgroundColor = UIColor.red
        roundButton.layer.masksToBounds = true
        roundButton.layer.cornerRadius = 10
        roundButton.addTarget(self, action: #selector(openAlertView), for: .touchUpInside)
        scrollView.addSubview(roundButton)
        
        let textField=UITextField(frame: CGRect(x: 40, y: 350, width: 280, height: 30))
        textField.borderStyle = .roundedRect
        textField.placeholder="Input text"
        scrollView.addSubview(textField)
        
        let leftViewTextField=UITextField(frame: CGRect(x: 40, y: 400, width: 280, height: 30))
//        let imageView=UIImageView(image: UIImage(named: "WechatIMG74"))
//        leftViewTextField.leftView=imageView
        leftViewTextField.placeholder="Just can input 11 numbers."
        leftViewTextField.leftViewMode = .always
        leftViewTextField.delegate=self
        scrollView.addSubview(leftViewTextField)
        
        let swi = UISwitch(frame: CGRect(x: 40, y: 450, width: 100, height: 40))
        swi.onTintColor = UIColor.green
        swi.tintColor = UIColor.red
        swi.thumbTintColor = UIColor.orange
        swi.addTarget(self, action: #selector(changeColor1), for: .touchUpInside)
        scrollView.addSubview(swi)
        
        let stepper = UIStepper()
        stepper.center = CGPoint(x: 200, y: 460)
        stepper.isContinuous = true
        stepper.autorepeat = true
        stepper.wraps = true
        stepper.minimumValue = 1
        stepper.maximumValue = 10
        stepper.stepValue = 1
        stepper.tintColor = UIColor.red
        stepper.addTarget(self, action: #selector(click), for: .valueChanged)
        scrollView.addSubview(stepper)
        
        let page = UIPageControl(frame: CGRect(x: 40, y: 500, width: 280, height: 30))
        page.currentPageIndicatorTintColor = UIColor.red
        page.addTarget(self, action: #selector(changeNum), for: .valueChanged)
        page.numberOfPages = 8
        scrollView.addSubview(page)
        
        let seg = UISegmentedControl(items: ["one", "", "two", "three"])
        seg.frame = CGRect(x: 40, y: 550, width: 280, height: 30)
        seg.setImage(UIImage(named: "WechatIMG74")?.withRenderingMode(.alwaysOriginal), forSegmentAt: 1)
        seg.setContentOffset(CGSize(width: 1, height: 1), forSegmentAt: 1)
        seg.isMomentary = true
        
        seg.insertSegment(withTitle: "new", at: 2, animated: true)
        seg.removeSegment(at: 1, animated: true)
        seg.setTitle("replace", forSegmentAt: 1)
//        seg.removeAllSegments()
        seg.apportionsSegmentWidthsByContent = true
        scrollView.addSubview(seg)
        
        let slider = UISlider(frame: CGRect(x: 40, y: 600, width: 280, height: 30))
        slider.isContinuous = true
        slider.minimumValue = 0
        slider.maximumValue = 10
        slider.minimumTrackTintColor = UIColor.red
        slider.maximumTrackTintColor = UIColor.green
        slider.thumbTintColor = UIColor.blue
        slider.addTarget(self, action: #selector(changeValue), for: .valueChanged)
        scrollView.addSubview(slider)

        let indicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        indicator.center = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height/2)
        indicator.color = UIColor.black
        scrollView.addSubview(indicator)
        indicator.startAnimating()

        let progressView = UIProgressView(frame: CGRect(x: 40, y: 650, width: 280, height: 30))
        progressView.progressTintColor = UIColor.red
        progressView.trackTintColor = UIColor.blue
        progressView.progress = 0.5
        scrollView.addSubview(progressView)
        
        let picker = UIPickerView(frame: CGRect(x: 40, y: 700, width: 280, height: 150))
        picker.delegate = self
        picker.dataSource = self
        scrollView.addSubview(picker)
        
        let searchBar = UISearchBar(frame: CGRect(x: 40, y: 800, width: 280, height: 30))
        searchBar.tintColor = UIColor.red
        searchBar.placeholder = "input search"
        searchBar.showsScopeBar = true
        searchBar.showsCancelButton = true
        searchBar.showsBookmarkButton = true
        searchBar.showsSearchResultsButton = true
        searchBar.scopeButtonTitles = ["one", "tow", "three"]
        searchBar.delegate = self
        scrollView.addSubview(searchBar)
        
        let datePicker = UIDatePicker(frame: CGRect(x: 40, y: 900, width: 280, height: 150))
        datePicker.datePickerMode = .time
        datePicker.addTarget(self, action: #selector(selectDate), for: .valueChanged)
        scrollView.addSubview(datePicker)
        
        scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height*2)
        self.view.addSubview(scrollView)
    }

    override func didReceiveMemoryWarning() {
        // Dispose of any resources that can be recreated.
        super.didReceiveMemoryWarning()
        tip+=1
        print("didReceiveMemoryWarning:\(tip)")
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        tip+=1
        print("init:\(tip)")
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        tip+=1
        print("init?:\(tip)")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        tip+=1
        print("awakeFromNib:\(tip)")
    }
    override func loadView() {
        super.loadView()
        tip+=1
        print("loadView:\(tip)")
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tip+=1
        print("viewWillLayoutSubviews:\(tip)")
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tip+=1
        print("viewDidLayoutSubviews:\(tip)")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tip+=1
        print("viewWillAppear:\(tip)")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tip+=1
        print("viewDidAppear:\(tip)")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tip+=1
        print("viewWillDisappear:\(tip)")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        tip+=1
        print("viewDidDisappear:\(tip)")
    }
    
    @objc func changeColor() {
        self.view.backgroundColor=UIColor(red: CGFloat(arc4random()%255)/255.0, green:CGFloat(arc4random()%255)/255.0, blue:CGFloat(arc4random()%255)/255.0, alpha:1)
    }
    
    @objc func changeColor1(swi: UISwitch?) {
        if swi!.isOn{
            self.view.backgroundColor = UIColor.red
        } else{
            self.view.backgroundColor = UIColor.white
        }
    }
    
    @objc func changeValue(slider:UISlider){
        print(slider.value)
    }
    
    @objc func click(steper:UIStepper){
        print(steper.value)
    }
    
    func textField(_ textField:UITextField, shouldChangeCharactersIn range:NSRange, replacementString string:String) -> Bool {
        if string.characters.count>0{
            let chars:[Character]=["0","1","2","3","4","5","6","7","8","9"]
            let char = string.characters.first!
            if !chars.contains(char){
                print("Pls input numbers.")
                return false
            }
            if textField.text!.characters.count+string.characters.count>11{
                print("Over 11 numbers.")
                return false
            }
        }
        return true
    }
    
    @objc func changeNum(page:UIPageControl) {
        print(page.currentPage)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(component) col \(row) row."
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 44
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 144
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("\(component) col \(row) row.")
    }
    
    @objc fileprivate func openAlertView() {
        let alertView = UIAlertController(title: "alert title", message: "alert msg", preferredStyle: .alert)
        let action = UIAlertAction(title: "action title", style: .default, handler: {(UIAlertAction)->Void in print("click")})
        let action2 = UIAlertAction(title: "cancel", style: .cancel, handler: {(UIAlertAction)->Void in print("cancel")})
        let action3 = UIAlertAction(title: "attention", style: .destructive, handler: {(UIAlertAction)->Void in print("attention")})
        alertView.addAction(action)
        alertView.addAction(action2)
        alertView.addAction(action3)
        alertView.addTextField{(textfield) in textfield.placeholder="place"}
        self.present(alertView, animated: true, completion: nil)
    }
    
    @objc fileprivate func openAlertView2(){
        let actionSheet = UIAlertController(title: "title", message: "msg", preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "one", style: .destructive, handler: {(UIAlertAction)->Void in print("one")})
        let action2 = UIAlertAction(title: "two", style: .default, handler: {(UIAlertAction)->Void in print("two")})
        let action3 = UIAlertAction(title: "three", style: .cancel, handler: {(UIAlertAction)->Void in print("three")})
        actionSheet.addAction(action)
        actionSheet.addAction(action2)
        actionSheet.addAction(action3)
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        openAlertView()
        openAlertView2()
    }
    
    @objc func selectDate(datePicker: UIDatePicker){
        print(datePicker.date)
    }

}

