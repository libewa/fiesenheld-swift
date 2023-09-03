import Foundation // Import Foundation. If you don't know what this is, think of it like stdlib
import DiscordKitBot // Import the DiscordKit module for all the wonders contained within

func getConfig() -> BotConfiguration {
        return try! JSONDecoder().decode(BotConfiguration.self, from: try! String(contentsOfFile: "config.json").data(using: .utf8)!)
}

/// The main entrypoint of our Discord bot
@main
public struct Bot {
    static let bot = Client(intents: .unprivileged)
    let token = getConfig().token
    public static func main() {
        let config = getConfig()
        bot.login(token: config.token) // Log in with the loaded token
        RunLoop.main.run()
    }
}

struct BotConfiguration: Decodable {
    let token: String
    let clientID: String
    let guildID: String?
}