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

    // MARK: - RawValue Tests

    func test_rawValue_fiveSegments_standardCases() {
        XCTAssertEqual(SegmentedGaugeType.veryHigh.rawValue(segments: .five), 5)
        XCTAssertEqual(SegmentedGaugeType.high.rawValue(segments: .five), 4)
        XCTAssertEqual(SegmentedGaugeType.medium.rawValue(segments: .five), 3)
        XCTAssertEqual(SegmentedGaugeType.low.rawValue(segments: .five), 2)
        XCTAssertEqual(SegmentedGaugeType.veryLow.rawValue(segments: .five), 1)
        XCTAssertEqual(SegmentedGaugeType.noData.rawValue(segments: .five), 0)
    }

    func test_rawValue_threeSegments_standardCases() {
        XCTAssertEqual(SegmentedGaugeType.veryHigh.rawValue(segments: .three), 3)
        XCTAssertEqual(SegmentedGaugeType.high.rawValue(segments: .three), 3)
        XCTAssertEqual(SegmentedGaugeType.medium.rawValue(segments: .three), 3)
        XCTAssertEqual(SegmentedGaugeType.low.rawValue(segments: .three), 2)
        XCTAssertEqual(SegmentedGaugeType.veryLow.rawValue(segments: .three), 1)
        XCTAssertEqual(SegmentedGaugeType.noData.rawValue(segments: .three), 0)
    }

    func test_rawValue_defaultSegments_standardCases() {
        XCTAssertEqual(SegmentedGaugeType.veryHigh.rawValue(), 5)
        XCTAssertEqual(SegmentedGaugeType.high.rawValue(), 4)
        XCTAssertEqual(SegmentedGaugeType.medium.rawValue(), 3)
        XCTAssertEqual(SegmentedGaugeType.low.rawValue(), 2)
        XCTAssertEqual(SegmentedGaugeType.veryLow.rawValue(), 1)
        XCTAssertEqual(SegmentedGaugeType.noData.rawValue(), 0)
    }

    func test_rawValue_customCase_fiveSegments() {
        // GIVEN
        let color = ColorTokenGeneratedMock.blue()
        let customType = SegmentedGaugeType.custom(level: 3, colorToken: color, dim: 0.5)

        // WHEN / THEN
        XCTAssertEqual(customType.rawValue(segments: .five), 3)
    }

    func test_rawValue_customCase_threeSegments() {
        // GIVEN
        let color = ColorTokenGeneratedMock.blue()
        let customType = SegmentedGaugeType.custom(level: 2, colorToken: color, dim: 0.5)

        // WHEN / THEN
        XCTAssertEqual(customType.rawValue(segments: .three), 2)
    }

    func test_rawValue_customCase_defaultSegments() {
        // GIVEN
        let color = ColorTokenGeneratedMock.blue()
        let customType = SegmentedGaugeType.custom(level: 4, colorToken: color, dim: 0.5)

        // WHEN / THEN
        XCTAssertEqual(customType.rawValue(), 4)
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
