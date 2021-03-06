package org.monet.core.model.observers;

import org.hamcrest.core.IsEqual;
import org.junit.*;
import org.monet.core.model.*;
import org.monet.core.test.Utils;

public class MultisigMinCosignatoriesModificationNotificationTest {

	@Test
	public void canCreateNotification() {
		// Act:
		final Account multisig = Utils.generateRandomAccount();
		final MultisigMinCosignatoriesModification modification = new MultisigMinCosignatoriesModification(3);
		final MultisigMinCosignatoriesModificationNotification notification = new MultisigMinCosignatoriesModificationNotification(multisig, modification);

		// Assert:
		Assert.assertThat(notification.getType(), IsEqual.equalTo(NotificationType.MinCosignatoriesModification));
		Assert.assertThat(notification.getMultisigAccount(), IsEqual.equalTo(multisig));
		Assert.assertThat(notification.getModification(), IsEqual.equalTo(modification));
	}
}
