//
//  QouteWidget.swift
//  QouteWidget
//
//  Created by Ray Nahimi on 16/04/2024.
//

import WidgetKit
import SwiftUI
import Intents
import Foundation
import UIKit
import FirebaseDatabase
import FirebaseDatabaseSwift





struct Provider: IntentTimelineProvider {
    var viewModel = NewAPI()
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent(), quote: viewModel.object)
        
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        Task{
            await viewModel.readObject()
            
            let entry = SimpleEntry(date: Date(), configuration: configuration, quote: viewModel.object)
            completion(entry)
        }
        
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        Task{
            await viewModel.readObject()
        }
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration, quote: viewModel.object)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}



struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let quote: Quote?
    
}


struct QouteWidgetEntryView : View {
    var entry: Provider.Entry

    
    var body: some View {
        
        VStack{
            Text(entry.quote?.qoute ?? "The quote is loading up!")
                .foregroundColor(.fontBrown)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.lightBackground)
        .redacted(reason: entry.quote?.qoute == nil ? .placeholder:[])
        
    }


}




struct QouteWidget: Widget {
    let kind: String = "QouteWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            QouteWidgetEntryView(entry: entry)
        }
        .supportedFamilies([.systemMedium])
        .configurationDisplayName("Quote a Day")
        .description("This will show the Quotes Daily")
    }
}

struct QouteWidget_Previews: PreviewProvider {
    static var previews: some View {
        QouteWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent(), quote: Quote(id: "1", qoute: "Test long as test to show if it hits the boxes edge", author: "Test", genre: [], prompt: "test") ))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
