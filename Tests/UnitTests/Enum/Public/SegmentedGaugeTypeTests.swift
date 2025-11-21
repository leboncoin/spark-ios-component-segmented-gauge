//
//  SegmentedGaugeTypeTests.swift
//  SparkComponentSegmentedGaugeUnitTests
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSegmentedGauge
@_spi(SI_SPI) import SparkThemingTesting

final class SegmentedGaugeTypeTests: XCTestCase {

    // MARK: - Tests

    func test_default_isMedium() {
        XCTAssertEqual(
            SegmentedGaugeType.default,
            .noData
        )
    }

    // MARK: - Equatable Tests

    func test_standardCases_equality() {
        XCTAssertEqual(SegmentedGaugeType.veryHigh, .veryHigh)
        XCTAssertEqual(SegmentedGaugeType.high, .high)
        XCTAssertEqual(SegmentedGaugeType.medium, .medium)
        XCTAssertEqual(SegmentedGaugeType.low, .low)
        XCTAssertEqual(SegmentedGaugeType.veryLow, .veryLow)
        XCTAssertEqual(SegmentedGaugeType.noData, .noData)
    }

    func test_standardCases_inequality() {
        XCTAssertNotEqual(SegmentedGaugeType.high, .low)
        XCTAssertNotEqual(SegmentedGaugeType.veryHigh, .noData)
    }

    func test_custom_equality_whenValuesMatch() {
        // GIVEN
        let color = ColorTokenGeneratedMock.blue()

        // WHEN
        let lhs = SegmentedGaugeType.custom(
            level: 2,
            colorToken: color,
            dim: 0.4
        )
        let rhs = SegmentedGaugeType.custom(
            level: 2,
            colorToken: color,
            dim: 0.4
        )

        // THEN
        XCTAssertEqual(lhs, rhs)
    }

    func test_custom_inequality_whenColorDiffers() {
        // GIVEN / WHEN
        let lhs = SegmentedGaugeType.custom(
            level: 2,
            colorToken: ColorTokenGeneratedMock.blue(),
            dim: 0.5
        )
        let rhs = SegmentedGaugeType.custom(
            level: 2,
            colorToken: ColorTokenGeneratedMock.orange(),
            dim: 0.5
        )

        // THEN
        XCTAssertNotEqual(lhs, rhs)
    }

    func test_custom_inequality_whenLevelDiffers() {
        // GIVEN / WHEN
        let color = ColorTokenGeneratedMock.blue()

        let lhs = SegmentedGaugeType.custom(
            level: 1,
            colorToken: color,
            dim: 0.5
        )
        let rhs = SegmentedGaugeType.custom(
            level: 3,
            colorToken: color,
            dim: 0.5
        )

        // THEN
        XCTAssertNotEqual(lhs, rhs)
    }

    func test_custom_inequality_whenDimDiffers() {
        // GIVEN / WHEN
        let color = ColorTokenGeneratedMock.blue()

        let lhs = SegmentedGaugeType.custom(
            level: 1,
            colorToken: color,
            dim: 0.4
        )
        let rhs = SegmentedGaugeType.custom(
            level: 1,
            colorToken: color,
            dim: 0.6
        )

        // THEN
        XCTAssertNotEqual(lhs, rhs)
    }
}
