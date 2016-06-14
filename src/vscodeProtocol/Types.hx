package vscodeProtocol;

import haxe.extern.EitherType;
import jsonrpc.Types;

/**
    Method names for the protocol requests and notifications.
    Each value must be typed as either `RequestMethod` or `NotificationMethod`.
**/
@:publicFields
class MethodNames {
    /**
        The initialize request is sent as the first request from the client to the server.
    **/
    static inline var Initialize = new RequestMethod<InitializeParams,InitializeResult,InitializeError>("initialize");

    /**
        The shutdown request is sent from the client to the server.
        It asks the server to shutdown, but to not exit (otherwise the response might not be delivered correctly to the client).
        There is a separate exit notification that asks the server to exit.
    **/
    static inline var Shutdown = new RequestMethod<NoData,NoData,NoData>("shutdown");

    /**
        A notification to ask the server to exit its process.
    **/
    static inline var Exit = new NotificationMethod<NoData>("exit");

    /**
        The show message notification is sent from a server to a client to ask the client to display a particular message in the user interface.
    **/
    static inline var ShowMessage = new NotificationMethod<ShowMessageParams>("window/showMessage");

    /**
        The log message notification is send from the server to the client to ask the client to log a particular message.
    **/
    static inline var LogMessage = new NotificationMethod<LogMessageParams>("window/logMessage");

    /**
        A notification send from the client to the server to signal the change of configuration settings.
    **/
    static inline var DidChangeConfiguration = new NotificationMethod<DidChangeConfigurationParams>("workspace/didChangeConfiguration");

    /**
        The document open notification is sent from the client to the server to signal newly opened text documents.
        The document's truth is now managed by the client and the server must not try to read the document's truth using the document's uri.
    **/
    static inline var DidOpenTextDocument = new NotificationMethod<DidOpenTextDocumentParams>("textDocument/didOpen");

    /**
        The document change notification is sent from the client to the server to signal changes to a text document.
    **/
    static inline var DidChangeTextDocument = new NotificationMethod<DidChangeTextDocumentParams>("textDocument/didChange");

    /**
        The document close notification is sent from the client to the server when the document got closed in the client.
        The document's truth now exists where the document's uri points to (e.g. if the document's uri is a file uri the truth now exists on disk).
    **/
    static inline var DidCloseTextDocument = new NotificationMethod<DidCloseTextDocumentParams>("textDocument/didClose");

    /**
        The document save notification is sent from the client to the server when the document for saved in the clinet.
    **/
    static inline var DidSaveTextDocument = new NotificationMethod<DidSaveTextDocumentParams>("textDocument/didSave");

    /**
        The watched files notification is sent from the client to the server when the client detects changes to file watched by the lanaguage client.
    **/
    static inline var DidChangeWatchedFiles = new NotificationMethod<DidChangeWatchedFilesParams>("workspace/didChangeWatchedFiles");

    /**
        Diagnostics notification are sent from the server to the client to signal results of validation runs.
    **/
    static inline var PublishDiagnostics = new NotificationMethod<PublishDiagnosticsParams>("textDocument/publishDiagnostics");

    /**
        The Completion request is sent from the client to the server to compute completion items at a given cursor position.
        Completion items are presented in the IntelliSense user interface.
        If computing complete completion items is expensive servers can additional provide a handler for the resolve completion item request.
        This request is send when a completion item is selected in the user interface.
    **/
    static inline var Completion = new RequestMethod<TextDocumentPositionParams,EitherType<Array<CompletionItem>,CompletionList>,NoData>("textDocument/completion");

    /**
        The request is sent from the client to the server to resolve additional information for a given completion item.
    **/
    static inline var CompletionItemResolve = new RequestMethod<CompletionItem,CompletionItem,NoData>("completionItem/resolve");

    /**
        The hover request is sent from the client to the server to request hover information at a given text document position.
    **/
    static inline var Hover = new RequestMethod<TextDocumentPositionParams,Hover,NoData>("textDocument/hover");

    /**
        The signature help request is sent from the client to the server to request signature information at a given cursor position.
    **/
    static inline var SignatureHelp = new RequestMethod<TextDocumentPositionParams,SignatureHelp,NoData>("textDocument/signatureHelp");

    /**
        The goto definition request is sent from the client to the server to to resolve the defintion location of a symbol at a given text document position.
    **/
    static inline var GotoDefinition = new RequestMethod<TextDocumentPositionParams,EitherType<Location,Array<Location>>,NoData>("textDocument/definition");

    /**
        The references request is sent from the client to the server to resolve project-wide references for the symbol denoted by the given text document position.
    **/
    static inline var FindReferences = new RequestMethod<ReferenceParams,Array<Location>,NoData>("textDocument/references");

    /**
        The document highlight request is sent from the client to the server to to resolve a document highlights for a given text document position.
    **/
    static inline var DocumentHighlights = new RequestMethod<TextDocumentPositionParams,DocumentHighlight,NoData>("textDocument/documentHighlight");

    /**
        The document symbol request is sent from the client to the server to list all symbols found in a given text document.
    **/
    static inline var DocumentSymbols = new RequestMethod<DocumentSymbolParams,Array<SymbolInformation>,NoData>("textDocument/documentSymbol");

    /**
        The workspace symbol request is sent from the client to the server to list project-wide symbols matching the query string.
    **/
    static inline var WorkspaceSymbols = new RequestMethod<WorkspaceSymbolParams,Array<SymbolInformation>,NoData>("workspace/symbol");

    /**
        The code action request is sent from the client to the server to compute commands for a given text document and range.
        The request is trigger when the user moves the cursor into an problem marker in the editor or presses the lightbulb associated with a marker.
    **/
    static inline var CodeAction = new RequestMethod<CodeActionParams,Array<Command>,NoData>("textDocument/codeAction");

    /**
        The code lens request is sent from the client to the server to compute code lenses for a given text document.
    **/
    static inline var CodeLens = new RequestMethod<CodeLensParams,Array<CodeLens>,NoData>("textDocument/codeLens");

    /**
        The code lens resolve request is sent from the clien to the server to resolve the command for a given code lens item.
    **/
    static inline var CodeLensResolve = new RequestMethod<CodeLens,CodeLens,NoData>("codeLens/resolve");

    /**
        The document formatting resquest is sent from the server to the client to format a whole document.
    **/
    static inline var DocumentFormatting = new RequestMethod<DocumentFormattingParams,Array<TextEdit>,NoData>("textDocument/formatting");

    /**
        The document range formatting request is sent from the client to the server to format a given range in a document.
    **/
    static inline var DocumentRangeFormatting = new RequestMethod<DocumentRangeFormattingParams,Array<TextEdit>,NoData>("textDocument/rangeFormatting");

    /**
        The document on type formatting request is sent from the client to the server to format parts of the document during typing.
    **/
    static inline var DocumentOnTypeFormatting = new RequestMethod<DocumentOnTypeFormattingParams,Array<TextEdit>,NoData>("textDocument/onTypeFormatting");

    /**
        The rename request is sent from the client to the server to do a workspace wide rename of a symbol.
    **/
    static inline var Rename = new RequestMethod<RenameParams,WorkspaceEdit,NoData>("textDocument/rename");

    /**
        This notification is sent from the server to the client to ask the client to log a particular message in the vshaxe output channel.
    **/
    static inline var VSHaxeLog = new NotificationMethod<String>("vshaxe/log");

    /**
        This notification is sent from the client to the server when display arguments index is changed.
    **/
    static inline var VSHaxeDidChangeDisplayConfigurationIndex = new NotificationMethod<{index:Int}>("vshaxe/didChangeDisplayConfigurationIndex");
}

/**
    Position in a text document expressed as zero-based line and character offset.
**/
typedef Position = {
    /**
        Line position in a document (zero-based).
    **/
    var line:Int;

    /**
        Character offset on a line in a document (zero-based).
    **/
    var character:Int;
}

/**
    A range in a text document expressed as (zero-based) start and end positions.
**/
typedef Range = {
    /**
        The range's start position
    **/
    var start:Position;

    /**
        The range's end position
    **/
    var end:Position;
}

/**
    Represents a location inside a resource, such as a line inside a text file.
**/
typedef Location = {
    var uri:String;
    var range:Range;
}

/**
    Represents a diagnostic, such as a compiler error or warning.
    Diagnostic objects are only valid in the scope of a resource.
**/
typedef Diagnostic = {
    /**
        The range at which the message applies
    **/
    var range:Range;

    /**
        The diagnostic's severity.
        If omitted it is up to the client to interpret diagnostics as error, warning, info or hint.
    **/
    @:optional var severity:DiagnosticSeverity;

    /**
        The diagnostic's code.
    **/
    @:optional var code:haxe.extern.EitherType<Int,String>;

    /**
        A human-readable string describing the source of this diagnostic, e.g. 'typescript' or 'super lint'.
    **/
    @:optional var source:String;

    /**
        The diagnostic's message.
    **/
    var message:String;
}

@:enum abstract DiagnosticSeverity(Int) {
    var Error = 1;
    var Warning = 2;
    var Information = 3;
    var Hint = 4;
}

/**
    Represents a reference to a command.
    Provides a title which will be used to represent a command in the UI and,
    optionally, an array of arguments which will be passed to the command handler function when invoked.
**/
typedef Command  ={
    /**
        Title of the command, like `save`.
    **/
    var title:String;

    /**
        The identifier of the actual command handler.
    **/
    var command:String;

    /**
        Arguments that the command handler should be invoked with.
    **/
    @:optional var arguments:Array<Dynamic>;
}

/**
    A textual edit applicable to a text document.
**/
typedef TextEdit = {
    /**
        The range of the text document to be manipulated.
        To insert text into a document create a range where start == end.
    **/
    var range:Range;

    /**
        The string to be inserted.
        For delete operations use an empty string.
    **/
    var newText:String;
}

/**
    A workspace edit represents changes to many resources managed in the workspace.
**/
typedef WorkspaceEdit = {
    /**
        Holds changes to existing resources.
    **/
    var changes:haxe.DynamicAccess<Array<TextEdit>>;
}

/**
    Text documents are identified using an URI.
    On the protocol level URI's are passed as strings.
**/
typedef TextDocumentIdentifier = {
    /**
        The text document's uri.
    **/
    var uri:String;
}

/**
    An item to transfer a text document from the client to the server.
**/
typedef TextDocumentItem = {
    /**
        The text document's uri.
    **/
    var uri:String;

    /**
        The text document's language identifier.
    **/
    var languageId:String;

    /**
        The version number of this document (it will strictly increase after each change, including undo/redo).
    **/
    var version:Int;

    /**
        The content of the opened text document.
    **/
    var text:String;
}

/**
    An identifier to denote a specific version of a text document.
**/
typedef VersionedTextDocumentIdentifier = {
    >TextDocumentIdentifier,

    /**
        The version number of this document.
    **/
    var version:Int;
}

/**
    A parameter literal used in requests to pass a text document and a position inside that document.
**/
typedef TextDocumentPositionParams = {
    /**
        The text document.
    **/
    var textDocument:TextDocumentIdentifier;

    /**
        The position inside the text document.
    **/
    var position:Position;
}

typedef InitializeParams = {
    /**
        The process Id of the parent process that started the server.
    **/
    var processId:Int;

    /**
        The rootPath of the workspace.
        Is `null` if no folder is open.
    **/
    var rootPath:Null<String>;

    /**
        The capabilities provided by the client (editor).
    **/
    var capabilities:ClientCapabilities;

    /**
        Initialization options passed from the client.
    **/
    @:optional var initializationOptions:Dynamic;
}

typedef InitializeResult = {
    /**
        The capabilities the language server provides.
    **/
    var capabilities:ServerCapabilities;
}

typedef InitializeError = {
    /**
        Indicates whether the client should retry to send the initilize request
        after showing the message provided in the `ResponseError`.
    **/
    var retry:Bool;
}

/**
    Currently empty.
**/
typedef ClientCapabilities = {}

/**
    Defines how the host (editor) should sync document changes to the language server.
**/
@:enum abstract TextDocumentSyncKind(Int) {
    /**
        Documents should not be synced at all.
    **/
    var None = 0;

    /**
        Documents are synced by always sending the full content of the document.
    **/
    var Full = 1;

    /**
        Documents are synced by sending the full content on open.
        After that only incremental updates to the document are send.
    **/
    var Incremental = 2;
}

typedef CompletionOptions = {
    /**
        The server provides support to resolve additional information for a completion item.
    **/
    @:optional var resolveProvider:Bool;

    /**
        The characters that trigger completion automatically.
    **/
    @:optional var triggerCharacters:Array<String>;
}

typedef SignatureHelpOptions = {
    /**
        The characters that trigger signature help automatically.
    **/
    @:optional var triggerCharacters:Array<String>;
}

typedef CodeLensOptions = {
    /**
        Code lens has a resolve provider as well.
    **/
    @:optional var resolveProvider:Bool;
}

typedef DocumentOnTypeFormattingOptions = {
    /**
        A character on which formatting should be triggered, like `}`.
    **/
    var firstTriggerCharacter:String;

    /**
        More trigger characters.
    **/
    @:optional var moreTriggerCharacter:Array<String>;
}

typedef ServerCapabilities = {
    /**
        Defines how text documents are synced.
    **/
    @:optional var textDocumentSync:TextDocumentSyncKind;

    /**
        The server provides hover support.
    **/
    @:optional var hoverProvider:Bool;

    /**
        The server provides completion support.
    **/
    @:optional var completionProvider:CompletionOptions;

    /**
        The server provides signature help support.
    **/
    @:optional var signatureHelpProvider:SignatureHelpOptions;

    /**
        The server provides goto definition support.
    **/
    @:optional var definitionProvider:Bool;

    /**
        The server provides find references support.
    **/
    @:optional var referencesProvider:Bool;

    /**
        The server provides document highlight support.
    **/
    @:optional var documentHighlightProvider:Bool;

    /**
        The server provides document symbol support.
    **/
    @:optional var documentSymbolProvider:Bool;

    /**
        The server provides workspace symbol support.
    **/
    @:optional var workspaceSymbolProvider:Bool;

    /**
        The server provides code actions.
    **/
    @:optional var codeActionProvider:Bool;

    /**
        The server provides code lens.
    **/
    @:optional var codeLensProvider:CodeLensOptions;

    /**
        The server provides document formatting.
    **/
    @:optional var documentFormattingProvider:Bool;

    /**
        The server provides document range formatting.
    **/
    @:optional var documentRangeFormattingProvider:Bool;

    /**
        The server provides document formatting on typing.
    **/
    @:optional var documentOnTypeFormattingProvider:DocumentOnTypeFormattingOptions;

    /**
        The server provides rename support.
    **/
    @:optional var renameProvider:Bool;
}

typedef ShowMessageParams = {
    /**
        The message type.
    **/
    var type:MessageType;

    /**
        The actual message.
    **/
    var message:String;
}

@:enum abstract MessageType(Int) to Int {
    var Error = 1;
    var Warning = 2;
    var Info = 3;
    var Log = 4;
}

typedef LogMessageParams = {
    /**
        The message type.
    **/
    var type:MessageType;

    /**
        The actual message.
    **/
    var message:String;
}

typedef DidChangeConfigurationParams = {
    /**
        The actual changed settings.
    **/
    var settings:Dynamic;
}

typedef DidOpenTextDocumentParams = {
    >TextDocumentIdentifier,

    /**
        The document that was opened.
    **/
    var textDocument:TextDocumentItem;
}

typedef DidChangeTextDocumentParams = {
    /**
        The document that did change.
        The version number points to the version after all provided content changes have been applied.
    **/
    var textDocument:VersionedTextDocumentIdentifier;

    /**
        The actual content changes.
    **/
    var contentChanges:Array<TextDocumentContentChangeEvent>;
}

/**
    An event describing a change to a text document.
    If `range` and `rangeLength` are omitted the new text is considered to be the full content of the document.
**/
typedef TextDocumentContentChangeEvent = {
    /**
        The range of the document that changed.
    **/
    @:optional var range:Range;

    /**
        The length of the range that got replaced.
    **/
    @:optional var rangeLength:Int;

    /**
        The new text of the document.
    **/
    var text:String;
}

typedef DidCloseTextDocumentParams = {
    /**
        The document that was closed.
    **/
    var textDocument:TextDocumentIdentifier;
}

typedef DidSaveTextDocumentParams = {
    /**
        The document that was saved.
    **/
    var textDocument:TextDocumentIdentifier;
}

typedef DidChangeWatchedFilesParams = {
    /**
        The actual file events.
    **/
    var changes:Array<FileEvent>;
}

/**
    The file event type.
**/
@:enum abstract FileChangeType(Int) to Int {
    var Created = 1;
    var Changed = 2;
    var Deleted = 3;
}

/**
    An event describing a file change.
**/
typedef FileEvent = {
    /**
        The file's uri.
    **/
    var uri:String;

    /**
        The change type.
    **/
    var type:FileChangeType;
}

typedef PublishDiagnosticsParams = {
    /**
        The URI for which diagnostic information is reported.
    **/
    var uri:String;

    /**
        An array of diagnostic information items.
    **/
    var diagnostics:Array<Diagnostic>;
}

typedef CompletionItem = {
    /**
        The label of this completion item.
        By default also the text that is inserted when selecting this completion.
    **/
    var label:String;

    /**
        The kind of this completion item.
        Based of the kind an icon is chosen by the editor.
    **/
    @:optional var kind:CompletionItemKind;

    /**
        A human-readable string with additional information about this item, like type or symbol information.
    **/
    @:optional var detail:String;

    /**
        A human-readable string that represents a doc-comment.
    **/
    @:optional var documentation:String;

    /**
        A string that shoud be used when comparing this item with other items.
        When `falsy` the label is used.
    **/
    @:optional var sortText:String;

    /**
        A string that should be used when filtering a set of completion items.
        When `falsy` the label is used.
    **/
    @:optional var filterText:String;

    /**
        A string that should be inserted a document when selecting this completion.
        When `falsy` the label is used.
    **/
    @:optional var insertText:String;

    /**
        An edit which is applied to a document when selecting this completion.
        When an edit is provided the value of `insertText` is ignored.
    **/
    @:optional var textEdit:TextEdit;

    /**
        An data entry field that is preserved on a completion item between a completion and a completion resolve request.
    **/
    @:optional var data:Dynamic;
}

/**
    Represents a collection of completion items to be presented in the editor.
**/
typedef CompletionList = {
    /**
        This list it not complete. Further typing should result in recomputing this list.
    **/
    var isIncomplete:Bool;

    /**
        The completion items.
    **/
    var items:Array<CompletionItem>;
}

/**
    The kind of a completion entry.
**/
@:enum abstract CompletionItemKind(Int) to Int {
    var Text = 1;
    var Method = 2;
    var Function = 3;
    var Constructor = 4;
    var Field = 5;
    var Variable = 6;
    var Class = 7;
    var Interface = 8;
    var Module = 9;
    var Property = 10;
    var Unit = 11;
    var Value = 12;
    var Enum = 13;
    var Keyword = 14;
    var Snippet = 15;
    var Color = 16;
    var File = 17;
    var Reference = 18;
}

typedef MarkedString = EitherType<String,{language:String, value:String}>;

/**
    The result of a hove request.
**/
typedef Hover = {
    /**
        The hover's content.
    **/
    var contents:EitherType<MarkedString,Array<MarkedString>>;

    /**
        An optional range.
    **/
    @:optional var range:Range;
}

/**
    Signature help represents the signature of something callable.
    There can be multiple signature but only one active and only one active parameter.
**/
typedef SignatureHelp = {
    /**
        One or more signatures.
    **/
    var signatures:Array<SignatureInformation>;

    /**
        The active signature.
    **/
    @:optional var activeSignature:Int;

    /**
        The active parameter of the active signature.
    **/
    @:optional var activeParameter:Int;
}

/**
    Represents the signature of something callable.
    A signature can have a label, like a function-name, a doc-comment, and a set of parameters.
**/
typedef SignatureInformation = {
    /**
        The label of this signature.
        Will be shown in the UI.
    **/
    var label:String;

    /**
        The human-readable doc-comment of this signature.
        Will be shown in the UI but can be omitted.
    **/
    @:optional var documentation:String;

    /**
        The parameters of this signature.
    **/
    @:optional var parameters:Array<ParameterInformation>;
}

/**
    Represents a parameter of a callable-signature.
    A parameter can have a label and a doc-comment.
**/
typedef ParameterInformation = {
    /**
        The label of this signature.
        Will be shown in the UI.
    **/
    var label:String;

    /**
        The human-readable doc-comment of this signature.
        Will be shown in the UI but can be omitted.
    **/
    @:optional var documentation:String;
}

typedef ReferenceParams = {
    >TextDocumentPositionParams,
    var context:ReferenceContext;
}

typedef ReferenceContext = {
    /**
        Include the declaration of the current symbol.
    **/
    var includeDeclaration:Bool;
}

/**
    A document highlight is a range inside a text document which deserves special attention.
    Usually a document highlight is visualized by changing the background color of its range.
**/
typedef DocumentHighlight = {
    /**
        The range this highlight applies to.
    **/
    var range:Range;

    /**
        The highlight kind, default is `DocumentHighlightKind.Text`.
    **/
    @:optional var kind:DocumentHighlightKind;
}

/**
    A document highlight kind.
**/
@:enum abstract DocumentHighlightKind(Int) to Int {
    /**
        A textual occurrance.
    **/
    var Text = 1;

    /**
        Read-access of a symbol, like reading a variable.
    **/
    var Read = 2;

    /**
        Write-access of a symbol, like writing to a variable.
    **/
    var Write = 3;
}

typedef DocumentSymbolParams = {
    /**
        The text document.
    **/
    var textDocument:TextDocumentIdentifier;
}

/**
    Represents information about programming constructs like variables, classes, interfaces etc.
**/
typedef SymbolInformation = {
    /**
        The name of this symbol.
    **/
    var name:String;

    /**
        The kind of this symbol.
    **/
    var kind:SymbolKind;

    /**
        The location of this symbol.
    **/
    var location:Location;

    /**
        The name of the symbol containing this symbol.
    **/
    @:optional var containerName:String;
}

@:enum abstract SymbolKind(Int) to Int {
    var File = 1;
    var Module = 2;
    var Namespace = 3;
    var Package = 4;
    var Class = 5;
    var Method = 6;
    var Property = 7;
    var Field = 8;
    var Constructor = 9;
    var Enum = 10;
    var Interface = 11;
    var Function = 12;
    var Variable = 13;
    var Constant = 14;
    var String = 15;
    var Number = 16;
    var Boolean = 17;
    var Array = 18;
}

/**
    The parameters of a Workspace Symbol Request.
**/
typedef WorkspaceSymbolParams = {
    /**
        A non-empty query string.
    **/
    var query:String;
}

/**
    Params for the CodeActionRequest
**/
typedef CodeActionParams = {
    /**
        The document in which the command was invoked.
    **/
    var textDocument:TextDocumentIdentifier;

    /**
        The range for which the command was invoked.
    **/
    var range:Range;

    /**
        Context carrying additional information.
    **/
    var context:CodeActionContext;
}

/**
    Contains additional diagnostic information about the context in which a code action is run.
**/
typedef CodeActionContext = {
    /**
        An array of diagnostics.
    **/
    var diagnostics:Array<Diagnostic>;
}

typedef CodeLensParams = {
    /**
        The document to request code lens for.
    **/
    var textDocument:TextDocumentIdentifier;
}

/**
    A code lens represents a command that should be shown along with source text,
    like the number of references, a way to run tests, etc.

    A code lens is _unresolved_ when no command is associated to it.
    For performance reasons the creation of a code lens and resolving should be done to two stages.
**/
typedef CodeLens = {
    /**
        The range in which this code lens is valid.
        Should only span a single line.
    **/
    var range:Range;

    /**
        The command this code lens represents.
    **/
    @:optional var command:Command;

    /**
        An data entry field that is preserved on a code lens item between a code lens and a code lens resolve request.
    **/
    @:optional var data:Dynamic;
}

typedef DocumentFormattingParams = {
    /**
        The document to format.
    **/
    var textDocument:TextDocumentIdentifier;

    /**
        The format options.
    **/
    var options:FormattingOptions;
}

/**
    Value-object describing what options formatting should use.
    This object can contain additional fields of type Bool/Int/Float/String.
**/
typedef FormattingOptions = {
    /**
        Size of a tab in spaces.
    **/
    var tabSize:Int;

    /**
        Prefer spaces over tabs.
    **/
    var insertSpaces:Bool;
}

typedef DocumentRangeFormattingParams = {
    /**
        The document to format.
    **/
    var textDocument:TextDocumentIdentifier;

    /**
        The range to format.
    **/
    var range:Range;

    /**
        The format options.
    **/
    var options:FormattingOptions;
}

typedef DocumentOnTypeFormattingParams = {
    /**
        The document to format.
    **/
    var textDocument:TextDocumentIdentifier;

    /**
        The position at which this request was send.
    **/
    var position:Position;

    /**
        The character that has been typed.
    **/
    var ch:String;

    /**
        The format options.
    **/
    var options:FormattingOptions;
}


typedef RenameParams = {
    /**
        The document to format.
    **/
    var textDocument:TextDocumentIdentifier;

    /**
        The position at which this request was send.
    **/
    var position:Position;

    /**
        The new name of the symbol.
        If the given name is not valid the request must return a `ResponseError` with an appropriate message set.
    **/
    var newName:String;
}
