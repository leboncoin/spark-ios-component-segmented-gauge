//
//  SegmentedGaugeColorsTests.swift
//  SparkComponentSegmentedGaugeUnitTests
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSegmentedGauge
@_spi(SI_SPI) import SparkThemingTesting

final class SegmentedGaugeColorsTests: XCTestCase {

    // MARK: - Default Values Tests

    func test_defaultInitializer_producesEqualInstances() {
        XCTAssertEqual(SegmentedGaugeColors(), SegmentedGaugeColors())
    }

    // MARK: - Function Tests

    func test_segmentBackground_withIsPlainTrue_returnsPlainSegmentBackground() {
        // GIVEN
        let plainColor = ColorTokenGeneratedMock.blue()
        let otherColor = ColorTokenGeneratedMock.green()
        let colors = SegmentedGaugeColors(
            plainSegmentBackground: plainColor,
            otherSegmentBackground: otherColor,
            plainSegmentBorder: ColorTokenGeneratedMock.yellow(),
            otherSegmentBorder: ColorTokenGeneratedMock.red(),
            markerOuterBackground: ColorTokenGeneratedMock.orange(),
            markerInnerBackground: ColorTokenGeneratedMock.purple()
        )

        // WHEN
        let result = colors.segmentBackground(isPlain: true)

        // THEN
        XCTAssertTrue(result.equals(plainColor))
    }

    func test_segmentBackground_withIsPlainFalse_returnsOtherSegmentBackground() {
        // GIVEN
        let plainColor = ColorTokenGeneratedMock.blue()
        let otherColor = ColorTokenGeneratedMock.green()
        let colors = SegmentedGaugeColors(
            plainSegmentBackground: plainColor,
            otherSegmentBackground: otherColor,
            plainSegmentBorder: ColorTokenGeneratedMock.yellow(),
            otherSegmentBorder: ColorTokenGeneratedMock.red(),
            markerOuterBackground: ColorTokenGeneratedMock.orange(),
            markerInnerBackground: ColorTokenGeneratedMock.purple()
        )

        // WHEN
        let result = colors.segmentBackground(isPlain: false)

        // THEN
        XCTAssertTrue(result.equals(otherColor))
    }

    func test_segmentBorder_withIsPlainTrue_returnsPlainSegmentBorder() {
        // GIVEN
        let plainBorderColor = ColorTokenGeneratedMock.yellow()
        let otherBorderColor = ColorTokenGeneratedMock.red()
        let colors = SegmentedGaugeColors(
            plainSegmentBackground: ColorTokenGeneratedMock.blue(),
            otherSegmentBackground: ColorTokenGeneratedMock.green(),
            plainSegmentBorder: plainBorderColor,
            otherSegmentBorder: otherBorderColor,
            markerOuterBackground: ColorTokenGeneratedMock.orange(),
            markerInnerBackground: ColorTokenGeneratedMock.purple()
        )

        // WHEN
        let result = colors.segmentBorder(isPlain: true)

        // THEN
        XCTAssertTrue(result.equals(plainBorderColor))
    }

    func test_segmentBorder_withIsPlainFalse_returnsOtherSegmentBorder() {
        // GIVEN
        let plainBorderColor = ColorTokenGeneratedMock.yellow()
        let otherBorderColor = ColorTokenGeneratedMock.red()
        let colors = SegmentedGaugeColors(
            plainSegmentBackground: ColorTokenGeneratedMock.blue(),
            otherSegmentBackground: ColorTokenGeneratedMock.green(),
            plainSegmentBorder: plainBorderColor,
            otherSegmentBorder: otherBorderColor,
            markerOuterBackground: ColorTokenGeneratedMock.orange(),
            markerInnerBackground: ColorTokenGeneratedMock.purple()
        )

        // WHEN
        let result = colors.segmentBorder(isPlain: false)

        // THEN
        XCTAssertTrue(result.equals(otherBorderColor))
    }

    func test_segmentBackground_behaviorConsistency() {
        // GIVEN
        let colors = SegmentedGaugeColors(
            plainSegmentBackground: ColorTokenGeneratedMock.blue(),
            otherSegmentBackground: ColorTokenGeneratedMock.green(),
            plainSegmentBorder: ColorTokenGeneratedMock.yellow(),
            otherSegmentBorder: ColorTokenGeneratedMock.red(),
            markerOuterBackground: ColorTokenGeneratedMock.orange(),
            markerInnerBackground: ColorTokenGeneratedMock.purple()
        )

        // WHEN / THEN
        XCTAssertTrue(colors.segmentBackground(isPlain: true).equals(colors.plainSegmentBackground))
        XCTAssertTrue(colors.segmentBackground(isPlain: false).equals(colors.otherSegmentBackground))
        XCTAssertFalse(colors.segmentBackground(isPlain: true).equals(colors.segmentBackground(isPlain: false)))
    }

    func test_segmentBorder_behaviorConsistency() {
        // GIVEN
        let colors = SegmentedGaugeColors(
            plainSegmentBackground: ColorTokenGeneratedMock.blue(),
            otherSegmentBackground: ColorTokenGeneratedMock.green(),
            plainSegmentBorder: ColorTokenGeneratedMock.yellow(),
            otherSegmentBorder: ColorTokenGeneratedMock.red(),
            markerOuterBackground: ColorTokenGeneratedMock.orange(),
            markerInnerBackground: ColorTokenGeneratedMock.purple()
        )

        // WHEN / THEN
        XCTAssertTrue(colors.segmentBorder(isPlain: true).equals(colors.plainSegmentBorder))
        XCTAssertTrue(colors.segmentBorder(isPlain: false).equals(colors.otherSegmentBorder))
        XCTAssertFalse(colors.segmentBorder(isPlain: true).equals(colors.segmentBorder(isPlain: false)))
    }

    // MARK: - Equatable Tests

    func test_equality_whenTokensMatch() {
        // GIVEN / THEN
        let lhs = SegmentedGaugeColors(
            plainSegmentBackground: ColorTokenGeneratedMock.blue(),
            otherSegmentBackground: ColorTokenGeneratedMock.green(),
            plainSegmentBorder: ColorTokenGeneratedMock.yellow(),
            otherSegmentBorder: ColorTokenGeneratedMock.red(),
            markerOuterBackground: ColorTokenGeneratedMock.orange(),
            markerInnerBackground: ColorTokenGeneratedMock.purple()
        )
        let rhs = SegmentedGaugeColors(
            plainSegmentBackground: ColorTokenGeneratedMock.blue(),
            otherSegmentBackground: ColorTokenGeneratedMock.green(),
            plainSegmentBorder: ColorTokenGeneratedMock.yellow(),
            otherSegmentBorder: ColorTokenGeneratedMock.red(),
            markerOuterBackground: ColorTokenGeneratedMock.orange(),
            markerInnerBackground: ColorTokenGeneratedMock.purple()
        )

        // THEN
        XCTAssertEqual(lhs, rhs)
    }

    func test_inequality_whenTokensDiffer() {
        // GIVEN / THEN
        let lhs = SegmentedGaugeColors(
            plainSegmentBackground: ColorTokenGeneratedMock.blue(),
            otherSegmentBackground: ColorTokenGeneratedMock.green(),
            plainSegmentBorder: ColorTokenGeneratedMock.yellow(),
            otherSegmentBorder: ColorTokenGeneratedMock.red(),
            markerOuterBackground: ColorTokenGeneratedMock.orange(),
            markerInnerBackground: ColorTokenGeneratedMock.purple()
        )
        let rhs = SegmentedGaugeColors(
            plainSegmentBackground: ColorTokenGeneratedMock.random(),
            otherSegmentBackground: ColorTokenGeneratedMock.random(),
            plainSegmentBorder: ColorTokenGeneratedMock.random(),
            otherSegmentBorder: ColorTokenGeneratedMock.random(),
            markerOuterBackground: ColorTokenGeneratedMock.random(),
            markerInnerBackground: ColorTokenGeneratedMock.random()
        )

        // THEN
        XCTAssertNotEqual(lhs, rhs)
    }
}
