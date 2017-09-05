//
//  FlightCardView.swift
//  FlightInfo
//
//  Created by Matteo Manferdini on 06/08/2017.
//  Copyright © 2017 Pure Creek. All rights reserved.
//

import UIKit

class FlightCardView: UIView {
	@IBOutlet private weak var airportSymbolsLabel: UILabel!
	@IBOutlet private weak var departureDayLabel: UILabel!
	@IBOutlet private weak var departureAirportLabel: UILabel!
	@IBOutlet private weak var airlineLabel: UILabel!
	@IBOutlet private weak var flightNumberLabel: UILabel!
	@IBOutlet private weak var durationLabel: UILabel!
	@IBOutlet private weak var arrivalDayLabel: UILabel!
	@IBOutlet private weak var arrivalAirportLabel: UILabel!
	
	var viewModel: ViewModel = ViewModel() {
		didSet {
			airportSymbolsLabel.text = viewModel.airportSymbols
			departureDayLabel.text = viewModel.departureDay
			departureAirportLabel.text = viewModel.departureAirport
			airlineLabel.text = viewModel.airline
			flightNumberLabel.text = viewModel.flightNumber
			durationLabel.text = viewModel.duration
			arrivalDayLabel.text = viewModel.arrivalDay
			arrivalAirportLabel.text = viewModel.arrivalAirport
		}
	}
}

extension FlightCardView {
	struct ViewModel {
		let airportSymbols: String
		let departureDay: String
		let departureAirport: String
		let airline: String
		let flightNumber: String
		let duration: String
		let arrivalDay: String
		let arrivalAirport: String
	}
}

extension FlightCardView.ViewModel {
	init(flight: Flight) {
		let departure = flight.departure
		let arrival = flight.arrival
		airportSymbols = departure.airport.symbol + " ➔ " + arrival.airport.symbol
		departureDay = departure.date.day
		departureAirport = departure.timeAndAirport
		airline = flight.airline
		flightNumber = flight.number
		duration = flight.duration.formatted
		arrivalDay = arrival.date.day
		arrivalAirport = arrival.timeAndAirport
	}
	
	init() {
		airportSymbols = ""
		departureDay = ""
		departureAirport = ""
		airline = ""
		flightNumber = ""
		duration = ""
		arrivalDay = ""
		arrivalAirport = ""
	}
}

extension TimeInterval {
	var formatted: String {
		let secondsInAnHour = 60 * 60
		let hours = Int(self) / secondsInAnHour
		let minutes = (Int(self) % secondsInAnHour) / 60
		return "\(hours) hours, \(minutes) minutes"
	}
}

extension Endpoint {
	var timeAndAirport: String {
		return date.time
			+ " "
			+ airport.city
			+ ", "
			+ airport.name
			+ " Airport"
	}
}

extension Date {
	var day: String {
		let formatter = DateFormatter()
		formatter.dateStyle = .full
		formatter.timeStyle = .none
		return formatter.string(from: self)
	}
	
	var time: String {
		let formatter = DateFormatter()
		formatter.dateFormat = "HH:mm"
		return formatter.string(from: self)
	}
}
