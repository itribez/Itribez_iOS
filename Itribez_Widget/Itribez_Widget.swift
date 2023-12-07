//
//  Itribez_Widget.swift
//  Itribez_Widget
//
//  Created by Indu Pandey on 04/12/23.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    
    let images = ["img_1", "img_2", "img_3", "img_4", "img_5", "img_6"]
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), str: "Test 1", configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), str: "Test 2", configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for timeOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .second, value: timeOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, str: images[timeOffset], configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    var str: String
    let configuration: ConfigurationIntent
}

struct Itribez_WidgetEntryView : View {
    var entry: Provider.Entry
   

    var body: some View {
        VStack{
            Text(entry.date, style: .time)
            Text("ITRIBEZ Posts")
            Image(entry.str)
        }
    }
}

struct Itribez_Widget: Widget {
    let kind: String = "Itribez_Widget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            Itribez_WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My New Widget")
        .description("This is an Our ITRIBEZ App widget.")
    }
}

struct Itribez_Widget_Previews: PreviewProvider {
    static var previews: some View {
        Itribez_WidgetEntryView(entry: SimpleEntry(date: Date(), str: "Test 1", configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
