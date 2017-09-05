//
//  ViewController.swift
//  FlightInfo
//
//  Created by Matteo Manferdini on 05/08/2017.
//  Copyright © 2017 Pure Creek. All rights reserved.
//

import UIKit

class FlightInfoViewController: UIViewController {
	@IBOutlet private weak var cardView: FlightCardView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		let flight = createFlight()
		cardView.viewModel = FlightCardView.ViewModel(flight: flight)
	}
}

private extension FlightInfoViewController {
	func createFlight() -> Flight {
		return Flight(
			airline: "Aeroflot",
			number: "AF 3245",
			departure: Endpoint(
				date: Date(),
				airport: Airport(symbol: "AMS", name: "Schipol", city: "Amsterdam")
			),
			arrival: Endpoint(
				date: Date().addingTimeInterval(3 * 60 * 60 + 10 * 60),
				airport: Airport(symbol: "SVO", name: "Sheremetyevo", city: "Moscow")
			)
		)
	}
}

