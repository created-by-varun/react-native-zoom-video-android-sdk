import assert from 'assert';

export const validateNonEmptyStringProp = (
  config: any,
  errorLabel: string,
  propName: string
) => {
  const prop = config[propName];
  if (typeof prop !== 'undefined') {
    assert.strictEqual(
      typeof prop,
      'string',
      `${errorLabel}: ${propName} must be a string`
    );

    assert.ok(
      prop.length > 0,
      `${errorLabel}: ${propName} must have more then 0 characters`
    );
  }
};

export const validateBooleanProp = (
  config: any,
  errorLabel: string,
  propName: string
) => {
  const prop = config[propName];
  if (typeof prop !== 'undefined') {
    assert.strictEqual(
      typeof prop,
      'boolean',
      `${errorLabel}: ${propName} must be a boolean`
    );
  }
};
