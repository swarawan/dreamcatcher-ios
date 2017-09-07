import Foundation

public protocol SharedInstanceType {
    init()
}

private var userSettingsSingletons = [String: SharedInstanceType]()
public extension SharedInstanceType {
    static var shared: Self {
        let className = String(describing: self)
        guard let singleton = userSettingsSingletons[className] as? Self else {
            let singleton = Self()
            userSettingsSingletons[className] = singleton
            return singleton
        }
        return singleton
    }
}

open class WRUserSettings: NSObject, SharedInstanceType {
    typealias Property = String
    
    fileprivate var childClassName: String { return String(describing: Mirror(reflecting: self).subjectType) }
    fileprivate var uniqueIdentifierKey: String { return "\(childClassName)-WRUserSettingsIdentifier" }
    fileprivate var userDefaults = UserDefaults.standard
    fileprivate var defaultValues: [String: Data] = [:]
    
    required override public init() {
        super.init()
        let mirror = Mirror(reflecting: self)
        for attr in mirror.children {
            guard let property = attr.label else { continue }
            saveDefaultValue(property)
            fillProperty(property)
            observe(property: property)
        }
        print(defaultValues)
    }
    
    fileprivate func userDefaultsKey(forProperty property: Property) -> String {
        return "\(uniqueIdentifierKey).\(property)"
    }
    
    private func saveDefaultValue(_ property: Property) {
        guard let object = self.value(forKeyPath: property) else { return }
        let archivedObject = NSKeyedArchiver.archivedData(withRootObject: object)
        defaultValues[property] = archivedObject
    }
    
    private func fillProperty(_ property: Property) {
        if let data = userDefaults.object(forKey: userDefaultsKey(forProperty: property)) as? Data {
            let value = NSKeyedUnarchiver.unarchiveObject(with: data)
            self.setValue(value, forKey: property)
        }
    }
    
    private func observe(property: Property) {
        self.addObserver(self, forKeyPath: property, options: [.new], context: nil)
    }
}

// MARK: Public methods

public extension WRUserSettings {
    public func reset() {
        for (property, defaultValue) in defaultValues {
            let value = NSKeyedUnarchiver.unarchiveObject(with: defaultValue)
            self.setValue(value, forKey: property)
        }
    }
}

// MARK: Description

extension WRUserSettings {
    override open var description: String {
        var settings = [String: Any]()
        for (key, value) in userDefaults.dictionaryRepresentation() where key.hasPrefix(uniqueIdentifierKey) {
            guard let data = value as? Data else { continue }
            let newKey = key.replacingOccurrences(of: "\(uniqueIdentifierKey).", with: "")
            let object = NSKeyedUnarchiver.unarchiveObject(with: data)
            settings[newKey] = object
        }
        return settings.description
    }
}

// MARK: KVO

extension WRUserSettings {
    override open func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard let keyPath = keyPath, let object = self.value(forKeyPath: keyPath) else { return }
        let archivedObject = NSKeyedArchiver.archivedData(withRootObject: object)
        userDefaults.set(archivedObject, forKey: userDefaultsKey(forProperty: keyPath))
        userDefaults.synchronize()
    }
}