package org.monet.core.model;

import org.monet.core.model.primitive.*;

/**
 * Fee calculator that always returns zero fees and accepts any fee.
 */
public class ZeroTransactionFeeCalculator implements TransactionFeeCalculator {
	@Override
	public Amount calculateMinimumFee(Transaction transaction) {
		return Amount.ZERO;
	}

	@Override
	public boolean isFeeValid(Transaction transaction, BlockHeight blockHeight) {
		return true;
	}
}
