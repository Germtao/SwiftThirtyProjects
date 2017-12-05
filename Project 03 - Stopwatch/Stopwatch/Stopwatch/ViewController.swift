//
//  ViewController.swift
//  Stopwatch
//
//  Created by TAO on 2017/12/4.
//  Copyright © 2017年 ShaggyT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - 私有属性
    private let mainStopwatch: Stopwatch = Stopwatch()
    private let lapStopwatch: Stopwatch = Stopwatch()
    private var isPlay: Bool = false
    private var lapsArray: [String] = [String]()

    // MARK: - UI
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var lapTimerLabel: UILabel!
    @IBOutlet weak var lapResetBtn: UIButton!
    @IBOutlet weak var startPauseBtn: UIButton!
    @IBOutlet weak var lapsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 闭包
        let initButton: (UIButton) -> Void = { button in
            button.layer.cornerRadius = 0.5 * button.bounds.size.width
            button.backgroundColor = UIColor.white
        }
        
        initButton(startPauseBtn)
        initButton(lapResetBtn)
        
        lapResetBtn.isEnabled = false
        
    }

    // MARK: - UI Setting
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    // MARK: - 开始/暂停计时
    @IBAction func playPauseBtnDidTap(_ sender: UIButton) {
        
        lapResetBtn.isEnabled = true
        changeButton(lapResetBtn, title: "Lap", titleColor: UIColor.black)
        
        if !isPlay {
            /// 无主引用
            unowned let weakSelf = self
            
            mainStopwatch.timer = Timer.scheduledTimer(timeInterval: 0.035, target: weakSelf, selector: #selector(updateMainTimer), userInfo: nil, repeats: true)
            lapStopwatch.timer = Timer.scheduledTimer(timeInterval: 0.035, target: weakSelf, selector: #selector(updateLapTimer), userInfo: nil, repeats: true)
            
            RunLoop.current.add(mainStopwatch.timer, forMode: .commonModes)
            RunLoop.current.add(lapStopwatch.timer, forMode: .commonModes)
            
            isPlay = true
            
            changeButton(startPauseBtn, title: "Stop", titleColor: UIColor.red)
            
        } else {
            
            mainStopwatch.timer.invalidate()
            lapStopwatch.timer.invalidate()
            
            isPlay = false
            
            changeButton(startPauseBtn, title: "Start", titleColor: UIColor.green)
            changeButton(lapResetBtn, title: "Reset", titleColor: UIColor.black)
        }
        
    }
    
    // MARK: - 重置
    @IBAction func lapResetBtnDidTap(_ sender: UIButton) {
        
        if !isPlay {
            resetMainTimer()
            resetLapTimer()
            changeButton(lapResetBtn, title: "Lap", titleColor: UIColor.lightGray)
            lapResetBtn.isEnabled = false
        } else {
            if let timerLabelText = timerLabel.text {
                lapsArray.append(timerLabelText)
            }
            lapsTableView.reloadData()
            resetLapTimer()
            
            /// 无主引用
            unowned let weakSelf = self
            lapStopwatch.timer = Timer.scheduledTimer(timeInterval: 0.035, target: weakSelf, selector: #selector(updateLapTimer), userInfo: nil, repeats: true)
            RunLoop.current.add(lapStopwatch.timer, forMode: .commonModes)
        }
        
    }

}

// MARK: - Private Funcs
extension ViewController {
    
    private func changeButton(_ button: UIButton, title: String, titleColor: UIColor) {
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
    }
    
    private func resetMainTimer() {
        resetTimer(mainStopwatch, label: timerLabel)
        lapsArray.removeAll()
        lapsTableView.reloadData()
    }
    
    private func resetLapTimer() {
        resetTimer(lapStopwatch, label: lapTimerLabel)
    }
    
    @objc private func updateMainTimer() {
        updateTimer(mainStopwatch, label: timerLabel)
    }
    
    @objc private func updateLapTimer() {
        updateTimer(lapStopwatch, label: lapTimerLabel)
    }
    
    /// private helpers
    private func updateTimer(_ stopwatch: Stopwatch, label: UILabel) {
        stopwatch.counter = stopwatch.counter + 0.035
        
        /// 分
        var minutes: String = "\((Int)(stopwatch.counter / 60))"
        if (Int)(stopwatch.counter / 60) < 10 {
            minutes = "0\((Int)(stopwatch.counter) / 60)"
        }
        
        /// 秒
        var seconds: String = String(format: "%.2f", stopwatch.counter.truncatingRemainder(dividingBy: 60))
        if stopwatch.counter.truncatingRemainder(dividingBy: 60) < 10 {
            seconds = "0" + seconds
        }
        
        label.text = minutes + ":" + seconds
    }
    
    private func resetTimer(_ stopwatch: Stopwatch, label: UILabel) {
        stopwatch.timer.invalidate()
        stopwatch.counter = 0.0
        label.text = "00:00:00"
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lapsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "lapCell", for: indexPath)
        
        if let labelNum = cell.viewWithTag(11) as? UILabel {
            labelNum.text = "Lap \(lapsArray.count - indexPath.row)"
        }
        if let labelTimer = cell.viewWithTag(12) as? UILabel {
            labelTimer.text = lapsArray[lapsArray.count - indexPath.row - 1]
        }
        
        return cell
    }
    
}
