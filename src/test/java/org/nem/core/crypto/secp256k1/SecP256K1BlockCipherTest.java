package org.monet.core.crypto.secp256k1;

import org.monet.core.crypto.*;

public class SecP256K1BlockCipherTest extends BlockCipherTest {

	@Override
	protected BlockCipher getBlockCipher(final KeyPair senderKeyPair, final KeyPair recipientKeyPair) {
		return new SecP256K1BlockCipher(senderKeyPair, recipientKeyPair);
	}

	@Override
	protected CryptoEngine getCryptoEngine() {
		return CryptoEngines.secp256k1Engine();
	}
}
