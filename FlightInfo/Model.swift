//
//  Model.swift
//  FlightInfo
//
//  Created by Matteo Manferdini on 06/08/2017.
//  Copyright © 2017 Pure Creek. All rights reserved.
//

import Foundation

struct Airport {
	let symbol: String
	let name: String
	let city: String
}

struct Endpoint {
	let date: Date
	let airport: Airport
}

struct Flight {
	let airline: String
	let number: String
	let departure: Endpoint
	let arrival: Endpoint
	
	var duration: TimeInterval {
		return arrival.date.timeIntervalSince(departure.date)
	}
}
