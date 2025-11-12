//
//  SegmentedGaugeIsMarkerEnvironmentValues.swift
//  SparkComponentSegmentedGauge
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var segmentedGaugeIsMarker = true
}

public extension View {

    /// Set the **isMarker** on the ``SparkSegmentedGauge``.
    ///
    /// The default value for this property is *true*.
    func sparkSegmentedGaugeIsMarker(_ isMarker: Bool) -> some View {
        self.environment(\.segmentedGaugeIsMarker, isMarker)
    }
}
