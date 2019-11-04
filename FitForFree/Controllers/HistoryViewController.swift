	//
//  HistoryViewController.swift
//  FitForFree
//
//  Created by user157961 on 11/3/19.
//  Copyright © 2019 Rick. All rights reserved.
//

import UIKit
import Charts

class HistoryViewController: UIViewController {

    @IBOutlet weak var barChartView: BarChartView!
    
    var days: [String]!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        days = ["Lunes","Martes", "Miercoles", "Jueves", "Viernes", "Sabado", "Domingo"]
        let tasks = [1.0,1.0,1.5,2.0,3.0,5.0,0.0]
        
        setChart(dataPoints: days, values: tasks)

        // Do any additional setup after loading the view.
    }
    
    func setChart(dataPoints:[String], values: [Double]) {
        var dataEntries: [BarChartDataEntry] = []
        var counter = 0.0
        
        for i in 0..<dataPoints.count {
            counter += 1.0
            let dataEntry = BarChartDataEntry(x: values[i], y: counter)
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Horas de Ejercicio")
        let chartData = BarChartData()
        chartData.addDataSet(chartDataSet)
        
        barChartView.data = chartData
        chartDataSet.colors = ChartColorTemplates.colorful()
        
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
