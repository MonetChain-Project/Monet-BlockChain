package org.monet.core.model;

import org.monet.core.serialization.*;

/**
 * Represents a monet name-value pair.
 */
public class monetProperty implements SerializableEntity {
	private final String name;
	private final String value;

	/**
	 * Creates a new monet properties entry.
	 *
	 * @param name The name.
	 * @param value The value.
	 */
	public monetProperty(final String name, final String value) {
		this.name = name;
		this.value = value;
	}

	/**
	 * Deserializes a monet property.
	 *
	 * @param deserializer The deserializer.
	 */
	public monetProperty(final Deserializer deserializer) {
		this.name = deserializer.readString("name");
		this.value = deserializer.readString("value");
	}

	/**
	 * Gets the name.
	 *
	 * @return The name.
	 */
	public String getName() {
		return this.name;
	}

	/**
	 * Gets the value.
	 *
	 * @return The value.
	 */
	public String getValue() {
		return this.value;
	}

	@Override
	public void serialize(final Serializer serializer) {
		serializer.writeString("name", this.name);
		serializer.writeString("value", this.value);
	}

	@Override
	public String toString() {
		return String.format("%s -> %s", this.name, this.value);
	}

	@Override
	public int hashCode() {
		return this.name.hashCode() ^ this.value.hashCode();
	}

	@Override
	public boolean equals(final Object obj) {
		if (!(obj instanceof monetProperty)) {
			return false;
		}

		final monetProperty rhs = (monetProperty)obj;
		return this.name.equals(rhs.name) && this.value.equals(rhs.value);
	}
}
