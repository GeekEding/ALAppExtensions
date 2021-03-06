﻿// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------

/// <summary>
/// Exposes function\alitys to add and retrieve translated texts for table fields.
/// </summary>
codeunit 3711 Translation
{
    Access = Public;

    var
        TranslationImplementation: Codeunit "Translation Implementation";

    /// <summary>
    /// Checks if there any translations present at all.
    /// </summary>
    /// <returns>True if there is at least one translation; false, otherwise.</returns>
    procedure Any(): Boolean
    begin
        exit(TranslationImplementation.Any());
    end;

    /// <summary>
    /// Gets the value of a field in the global language for the record.
    /// </summary>
    /// <param name="RecVariant">The record to get the translated value for.</param>
    /// <param name="FieldId">The ID of the field for which the translation is stored.</param>
    /// <returns>The translated value.</returns>
    /// <example>
    /// To get the value of the description field for an item record, call GetValue(Item, Item.FIELDNO(Description)).
    /// </example>
    /// <remarks>
    /// If a translated record for the global language cannot be found it finds the Windows language translation.
    /// If a Windows language translation cannot be found, return an empty string.
    /// </remarks>
    procedure Get(RecVariant: Variant; FieldId: Integer): Text
    begin
        exit(TranslationImplementation.Get(RecVariant, FieldId, GlobalLanguage(), true));
    end;

    /// <summary>
    /// Gets the value of a field in the language that is specified for the record.
    /// </summary>
    /// <param name="RecVariant">The record to get the translated value for.</param>
    /// <param name="FieldId">The ID of the field to store the translation for.</param>
    /// <param name="LanguageId">The ID of the language in which to get the field value.</param>
    /// <returns>The translated value.</returns>
    /// <example>
    /// To get the value of the Description field for an item record in Danish, call GetValue(Item, Item.FIELDNO(Description), 1030).
    /// </example>
    procedure Get(RecVariant: Variant; FieldId: Integer; LanguageId: Integer): Text
    begin
        exit(TranslationImplementation.Get(RecVariant, FieldId, LanguageId));
    end;

    /// <summary>
    /// Sets the value of a field to the global language for the record.
    /// </summary>
    /// <param name="RecVariant">The record to store the translated value for.</param>
    /// <param name="FieldId">The ID of the field to store the translation for.</param>
    /// <param name="Value">The translated value to set.</param>
    procedure Set(RecVariant: Variant; FieldId: Integer; Value: Text[2048])
    begin
        TranslationImplementation.Set(RecVariant, FieldId, Value);
    end;

    /// <summary>
    /// Sets the value of a field to the language specified for the record.
    /// </summary>
    /// <param name="RecVariant">The record to store the translated value for.</param>
    /// <param name="FieldId">The ID of the field to store the translation for.</param>
    /// <param name="LanguageId">The language id to set the value for.</param>
    /// <param name="Value">The translated value to set.</param>
    procedure Set(RecVariant: Variant; FieldId: Integer; LanguageId: Integer; Value: Text[2048])
    begin
        TranslationImplementation.Set(RecVariant, FieldId, LanguageId, Value);
    end;

    /// <summary>
    /// Deletes all translations for a persisted (non temporary) record.
    /// </summary>
    /// <param name="RecVariant">The record for which the translations will be deleted.</param>
    procedure Delete(RecVariant: Variant)
    begin
        TranslationImplementation.Delete(RecVariant);
    end;

    /// <summary>
    /// Deletes the translation for a field on a persisted (non temporary) record.
    /// </summary>
    /// <param name="RecVariant">The record with a field for which the translation will be deleted.</param>
    /// <param name="FieldId">Id of the field for which the translation will be deleted.</param>
    procedure Delete(RecVariant: Variant; FieldId: Integer)
    begin
        TranslationImplementation.Delete(RecVariant, FieldId);
    end;

    /// <summary>
    /// Shows all language translations that are available for a field in a new page.
    /// </summary>
    /// <param name="RecVariant">The record to get the translated value for.</param>
    /// <param name="FieldId">The ID of the field to get translations for.</param>
    procedure Show(RecVariant: Variant; FieldId: Integer)
    begin
        TranslationImplementation.Show(RecVariant, FieldId);
    end;

    /// <summary>
    /// Shows all language translations available for a given field for all the records in that table in a new page.
    /// </summary>
    /// <param name="TableId">The table ID to get translations for.</param>
    /// <param name="FieldId">The ID of the field to get translations for.</param>
    procedure ShowForAllRecords(TableId: Integer; FieldId: Integer)
    begin
        TranslationImplementation.ShowForAllRecords(TableId, FieldId);
    end;
}

