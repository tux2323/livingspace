<g:form action="validateSignature" class="form-horizontal" method="post">

    <div class="control-group fb-login" style="display: none;">
        <div class="controls">
            <fb:login-button class="popover-info" data-original-title="Tippen sparen Daten aus Facebook Profile"
                             data-content="Wenn Du möchtest kannst Du Name und E-Mail für die Unterschrift aus deinem Facebook Profile übernehmen.">
                Daten übernehmen</fb:login-button>
        </div>
    </div>

    <bootstrap:controlGroup bean="${signer}" name="name" label="Familienname*">
        <g:textField id="signerName" name="name" value="${signer?.name}" class="span4 popover-info"
                     data-original-title="Name muss angegeben werden."
                     data-content="Du kannst allerdings entscheiden ob der Name Deiner Familie
                           öffentlich auf dieser Web-Seite angezeigt werden darf."/>
    </bootstrap:controlGroup>

    <div class="control-group">
        <div class="controls">
            <label class="checkbox" for="publicSigner">
                <g:checkBox name="publicSigner" value="${signer ? signer.publicSigner : true}"/>
                Darf die Unterschrift öffentlich auf unserer Website mit Deinem Familienname angezeigt werden?
            </label>
        </div>
    </div>

    <bootstrap:controlGroup bean="${signer}" name="email" label="E-Mail*">
        <g:textField id="signerEmail" name="email" value="${signer?.email}" class="span4 popover-info"
                     data-original-title="E-Mail muss angegeben werden."
                     data-content=" Wir nutzen die E-Mail um sicherzustellen dass es nicht zu doppelten Unterschriften kommt.
                            Deine E-Mail wird von uns genutzt um Dich ggf. über Wohnungsprojekte der Initiative zu informieren.
                            Wir geben die E-Mail nicht an dritte weiter."/>
    </bootstrap:controlGroup>

    <bootstrap:controlGroup bean="${signer}" name="numberOfChildren" label="Anzahl Kinder">
        <g:select class="popover-info"
                  name="numberOfChildren" from="${1..6}" value="${signer?.numberOfChildren}"
                  noSelection="[0: '- Keine Angabe -']"
                  data-original-title="Anzahl Kinder muss nicht ausgefüllt werden"
                  data-content="Die Angabe zur Anzahl der Kinder dient uns um die Wohnungsmarktsituation in Konstanz besser einschätzen zu können.
                        Also wie viele Familien mit wie viel Personen haben keinen adäquaten Wohnraum. "/>
    </bootstrap:controlGroup>

    <div class="control-group">
        <label class="control-label">
            Seit ihr beide berufstätig?
        </label>

        <div class="controls">

            <label class="radio">
                <input type="radio"  name="working" value="${null}"  ${signer == null || signer.working == null ? 'checked' : ''}>
                Keine Angabe
            </input>
            </label>
            <br />
            <label class="radio">
                <input type="radio"  name="working" value="${false}" ${signer?.working == false ? 'checked' : ''}>
                Es sind nicht beide Elternteile berufstätig
            </input>
            </label>
            <br />
            <label class="radio">
                <input type="radio"  name="working" value="${true}" ${signer?.working == true ? 'checked' : ''}>
                Beide Elternteile sind berufstätig
            </input>
            </label>

        </div>
    </div>

    <bootstrap:controlGroup bean="${signer}" name="description" label="Beschreibung Wohnungssituation">
        <g:textArea
                class="input-xlarge popover-info"
                cols="3" rows="5"
                name="description" value="${signer?.description}"
                data-original-title="Angaben zur Wohnungssituation sind optional."
                data-content="Die Angaben zur Wohnungssituation dienen uns eure Situation besser einschätzen zu können.
            Und ggf. auch direkt mit Dir Kontakt aufzunehmen."/>
    </bootstrap:controlGroup>

    <div class="control-group">
        <div class="controls">
            <g:submitButton name="Unterzeichnen" class="btn btn-large btn-primary" title="Unterzeichnen"/>
        </div>
    </div>
</g:form>