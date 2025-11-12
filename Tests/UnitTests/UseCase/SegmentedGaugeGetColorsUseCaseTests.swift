//
//  SegmentedGaugeGetColorsUseCaseTests.swift
//  SparkComponentSegmentedGaugeUnitTests
//
//  Created by robin.lemaire on 30/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSegmentedGauge
@_spi(SI_SPI) import SparkThemingTesting

final class SegmentedGaugeGetColorsUseCaseTests: XCTestCase {

    // MARK: - Properties

    private let useCase = SegmentedGaugeGetColorsUseCase()
    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Very High Type Tests

    func test_execute_veryHighType_returnsSuccessColor() {
        // GIVEN
        let type = SegmentedGaugeType.veryHigh

        let expectedColors = SegmentedGaugeColors(
            plainSegmentBackground: self.theme.colors.feedback.success,
            otherSegmentBackground: self.theme.colors.base.surface,
            plainSegmentBorder: self.theme.colors.feedback.success,
            otherSegmentBorder: self.theme.colors.base.outline,
            markerOuterBackground: self.theme.colors.base.surface,
            markerInnerBackground: self.theme.colors.feedback.success
        )

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            type: type
        )

        // THEN
        XCTAssertEqual(result, expectedColors)
    }

    // MARK: - High Type Tests

    func test_execute_highType_returnsSuccessColor() {
        // GIVEN
        let type = SegmentedGaugeType.high

        let expectedColors = SegmentedGaugeColors(
            plainSegmentBackground: self.theme.colors.feedback.success,
            otherSegmentBackground: self.theme.colors.base.surface,
            plainSegmentBorder: self.theme.colors.feedback.success,
            otherSegmentBorder: self.theme.colors.base.outline,
            markerOuterBackground: self.theme.colors.base.surface,
            markerInnerBackground: self.theme.colors.feedback.success
        )

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            type: type
        )

        // THEN
        XCTAssertEqual(result, expectedColors)
    }

    // MARK: - Medium Type Tests

    func test_execute_mediumType_returnsNeutralColor() {
        // GIVEN
        let type = SegmentedGaugeType.medium

        let expectedColors = SegmentedGaugeColors(
            plainSegmentBackground: self.theme.colors.feedback.neutral,
            otherSegmentBackground: self.theme.colors.base.surface,
            plainSegmentBorder: self.theme.colors.feedback.neutral,
            otherSegmentBorder: self.theme.colors.base.outline,
            markerOuterBackground: self.theme.colors.base.surface,
            markerInnerBackground: self.theme.colors.feedback.neutral
        )

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            type: type
        )

        // THEN
        XCTAssertEqual(result, expectedColors)
    }

    // MARK: - Low Type Tests

    func test_execute_lowType_returnsAlertColor() {
        // GIVEN
        let type = SegmentedGaugeType.low

        let expectedColors = SegmentedGaugeColors(
            plainSegmentBackground: self.theme.colors.feedback.alert,
            otherSegmentBackground: self.theme.colors.base.surface,
            plainSegmentBorder: self.theme.colors.feedback.alert,
            otherSegmentBorder: self.theme.colors.base.outline,
            markerOuterBackground: self.theme.colors.base.surface,
            markerInnerBackground: self.theme.colors.feedback.alert
        )

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            type: type
        )

        // THEN
        XCTAssertEqual(result, expectedColors)
    }

    // MARK: - Very Low Type Tests

    func test_execute_veryLowType_returnsErrorColor() {
        // GIVEN
        let type = SegmentedGaugeType.veryLow

        let expectedColors = SegmentedGaugeColors(
            plainSegmentBackground: self.theme.colors.feedback.error,
            otherSegmentBackground: self.theme.colors.base.surface,
            plainSegmentBorder: self.theme.colors.feedback.error,
            otherSegmentBorder: self.theme.colors.base.outline,
            markerOuterBackground: self.theme.colors.base.surface,
            markerInnerBackground: self.theme.colors.feedback.error
        )

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            type: type
        )

        // THEN
        XCTAssertEqual(result, expectedColors)
    }

    // MARK: - No Data Type Tests

    func test_execute_noDataType_returnsSurfaceColor() {
        // GIVEN
        let type = SegmentedGaugeType.noData

        let expectedColors = SegmentedGaugeColors(
            plainSegmentBackground: self.theme.colors.base.surface,
            otherSegmentBackground: self.theme.colors.base.surface,
            plainSegmentBorder: self.theme.colors.base.surface,
            otherSegmentBorder: self.theme.colors.base.outline,
            markerOuterBackground: self.theme.colors.base.surface,
            markerInnerBackground: self.theme.colors.base.surface
        )

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            type: type
        )

        // THEN
        XCTAssertEqual(result, expectedColors)
    }

    // MARK: - Custom Type Tests

    func test_execute_customType_returnsCustomColor() {
        // GIVEN
        let customColor = ColorTokenGeneratedMock.blue()
        let type = SegmentedGaugeType.custom(level: 2, colorToken: customColor)

        let expectedColors = SegmentedGaugeColors(
            plainSegmentBackground: customColor,
            otherSegmentBackground: self.theme.colors.base.surface,
            plainSegmentBorder: customColor,
            otherSegmentBorder: self.theme.colors.base.outline,
            markerOuterBackground: self.theme.colors.base.surface,
            markerInnerBackground: customColor
        )

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            type: type
        )

        // THEN
        XCTAssertEqual(result, expectedColors)
    }

    // MARK: - Common Properties Tests

    func test_execute_allTypes_usesSameOtherSegmentBackground() {
        // GIVEN
        let types: [SegmentedGaugeType] = [
            .veryHigh, .high, .medium, .low, .veryLow, .noData,
            .custom(level: 3, colorToken: ColorTokenGeneratedMock.blue())
        ]

        // WHEN / THEN
        for type in types {
            let result = self.useCase.execute(
                theme: self.theme,
                type: type
            )
            XCTAssertTrue(result.otherSegmentBackground.equals(self.theme.colors.base.surface))
            XCTAssertTrue(result.markerOuterBackground.equals(self.theme.colors.base.surface))
            XCTAssertTrue(result.otherSegmentBorder.equals(self.theme.colors.base.outline))
        }
    }
}
